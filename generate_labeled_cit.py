"""
This code is to generate pdfs from bbls and generate citation strings from pdfs.
The citation strings will be parsed and each field in one citation
string will be extracted. The code will output citation strings in CONLL format:
C. B-author
Farhat I-author
, O
I. B-author
Harari I-author
and O
U. B-author
Hetmaniuk I-author
, O
the B-title
discontinuous I-title
enrichment I-title
method I-title
for I-title
multiscale I-title
analysis I-title
"""
import os
import sys
import re
import glob
import subprocess
import shlex
from os import path
from subprocess import Popen, PIPE
from collections import OrderedDict
from personalnames import names

#read the bbl folder path  
conf = sys.argv[1]
#read the temp.tex file which will be used to generate pdf file
temp_content = open("templates/temp.tex", 'r').read()
#directory where authors' names are stored 
directories = sys.argv[2]
#aux and bbl files directory 
aux_dir = sys.argv[2] 

#this function is to extract fields of in a citation string and 
# store them in a list 
def label_one_cit(cit,bbl_file):
    #read authors' name for the corrent bbl file
    author_names = open(directories+'/split_bib/'+conf+'/'+bbl_file[:-4]+'.author').read().strip()
    author_names = author_names.split('\n')
    #handle multiline citations
    cit = cit.replace('-\n','').strip()
    cit = cit.replace('\n',' ').strip()
    #loop through each author's name
    for name in author_names:
        name = name.strip()
        #try to generate the author's name in two formats.
        try:
            #one is firs name, last name and last nanme, first name with white sapce 
            formats1 = names.name_initials(
                name=name, name_formats=["firstnamelastname", "lastnamefirstname"]
            )
            #one is first name, last name without white space 
            formats2 = names.name_initials(
                name=name, name_formats=["firstnamelastname"], non_ws=True
            )
            #combine those two formats into one list 
            all_formats = formats1+formats2
            #loop through all the generated 
            for one_format in all_formats:
                if one_format in cit:
                    #add label into the citation string for authors' name 
                    cit = cit.replace(one_format,'@@@author@@@ '+one_format+' @@@@author@@@@')
                    break
        except Exception as e:
            continue
    """
    @@@author@@@ Raﬁi, Z. a. @@@@author@@@@ et al. (@@@year@@@ 2014 @@@@year@@@@).
    @@@title@@@ repet for background/foreground separation in audio
    @@@@title@@@@. In @@@booktitle@@@ Blind Source Separation
    @@@@booktitle@@@@, pages @@@pages@@@ 395–411 @@@@pages@@@@.
    @@@publisher@@@ Springer @@@@publisher@@@@.
    This is an example of generated citation string. In this string different fields are separeted 
    by @@@label@@@ and @@@@label@@@@. @@@ means begining of a field and @@@@ means end of a field. 
    use regular expression to find all labels with @@@label@@@ and @@@@label@@@
    @@@ means that it's the begining of a field and @@@@ means that it's the end of a field 
    """
    all_labels = re.findall(r'@@@.+?@@@',cit)
    for index in range(len(all_labels)):
        #if the label begin with @@@@, this lable is the end 
        if all_labels[index][:4] == '@@@@':
            #add one @ at the end so the end label becomes @@@@label@@@@
            all_labels[index]+='@'
    label_value = []
    reverse = False
    #loop throgh all the labels 
    for index in range(len(all_labels)):
        #if it's the first label
        if index == 0:
            #split the citation by the first label 
            cit = re.split(all_labels[index],cit,1)
            value = cit[0].strip()
            #if there is a string before the first label 
            if len(value)>0:
                #check if the label is in revers order 
                if '@@@@' in all_labels[index]:
                    #if the label is in reverse order, add the label and value in a list 
                    label_value.append([value,all_labels[index][4:-4]])
                    reverse = True
                else:
                    #if not assign 'O' label to the value
                    label_value.append([value,'O'])
            #remove the part before the label of the citation string 
            cit = cit[1]
        #if it's not the first label
        else:
            #if it's not in the reverse order 
            if not reverse:
                #if previous label contain @@@@
                if '@@@@' in all_labels[index-1]:
                    """
                    This part of code is to handel the corner case when two labels are connected such as 
                    @@@author@@@ Xu @@@@author@@@@@@@year@@@ 1995 @@@@year@@@@
                    """
                    #if current label contains @@@@
                    if '@@@@' in all_labels[index]:
                        #split the current label
                        labels = all_labels[index].split('@')
                        #count the number of @
                        num_at = 0
                        #indicator if the character is @
                        is_at = False
                        #read the citation string and count until the character is not @
                        for at in cit:
                            if at =='@':
                                is_at = True
                                num_at+=1
                            elif not at =='@':
                                if is_at:
                                    break
                        #correct current label with number of @ around it
                        for label in labels:
                            if len(label)>0:
                                all_labels[index] = '@'*num_at+label+'@'*num_at
                                break
                    #split the current citation with the corrent label
                    cit = re.split(all_labels[index],cit,1)
                    value = cit[0].strip()
                    if len(value)>0:
                        #since the previous label is the ending label and next label is the beginning label 
                        #this string is labeled as 'O'
                        label_value.append([value,'O'])
                    #remove the previous part from citation string 
                    cit = cit[1] 
                #if there is no ending label in previous field 
                else:
                    #split the citation string with current label
                    cit = re.split(all_labels[index],cit,1)
                    value = cit[0].strip()
                    #add field and its label to a list 
                    label_value.append([value,all_labels[index-1][3:-3]])
                    #remove previous part from citation string 
                    cit = cit[1]
            #if it's in the reverse order 
            else:
                #if the current label is the begining label 
                if not '@@@@' in all_labels[index]:
                    #split the citation by the first label
                    cit = re.split(all_labels[index],cit,1)
                    cit = cit[1].strip()
                    #since the citation is in reverse order 
                    #add the value to previous value
                    cit = re.split(' ',cit,1)
                    value = cit[0].strip()
                    label_value[-1][0] += ' '+value
                    cit = cit[1].strip()
                    #if the next label is not ending label
                    #the rest of the labels are not in the reverse order 
                    if not '@@@@' in all_labels[index+1]:
                        reverse = False
                #if the current label is the ending label 
                else:
                    #split the cit by current label 
                    cit = re.split(all_labels[index],cit,1)
                    value = cit[0].strip()
                    if len(value)>0:
                        #if the next label is not the ending label
                        if not '@@@@' in all_labels[index+1]:
                            label_value.append([value,all_labels[index][4:-4]])
                            #the next label is in reverse order 
                            reverse = True
                        #if the next label is then ending label
                        else:
                            label_value.append([value,all_labels[index][4:-4]])
                            #the next label is not in reverse order 
                            reverse = False
                    cit = cit[1].strip()
    #if the rest of citation string is not empty 
    if len(cit)>0:
        #if the label list is not empty 
        if len(all_labels)>0:
            #if the last label is an ending label 
            if '@@@@' in all_labels[-1]:
                #the label for the last field is 'O'
                label_value.append([cit.strip(),'O'])
            #if the last label is a beginning label
            else:
                #the label for the last field is the last label
                label_value.append([cit.strip(),all_labels[-1][3:-3]])
    #return the field and label list
    return label_value

#this function will wirte the tokens in citations and their corresponding labels
#into the output file in CONLL format 
def write_labeled_cit(cit_of_one_paper,_Path_):
    #open the output file 
    f = open( _Path_ ,'w+')
    #loop through all citations
    for one_citation in cit_of_one_paper:
        #loop through all fields in one citation 
        for one_entry in one_citation:
            #split one field into tokens 
            values = one_entry[0].split(' ')
            #indicator of beginning of a field
            beginning = True
            #loop all tokens in one field 
            for word in values:
                if len(word)>0:
                    #if it's the first token in this field 
                    if beginning:
                        #if the label is author 
                        if one_entry[1] == 'author':
                            #if a specitial token is at the beginning of the author's name 
                            if word == '&' or word == ',' or word == 'et~al.' or word == 'et' or word =='al.' or word =='@' or word == 'and' or word=='(' or word==')':
                                #assign 'O' label to this token
                                f.write(word+' '+'O'+'\n')
                                beginning = True
                            #if no specital token is at the beginning of the author's name
                            else:
                                #assign B-author to this token
                                f.write(word+' B-'+one_entry[1]+'\n')
                                beginning = False
                        #if the label is 'O'
                        elif one_entry[1] == 'O':
                            #just assign 'O' to the token
                            f.write(word+' '+one_entry[1]+'\n')
                        #if the label is not author nor 'O'
                        else:
                            #assign B-label to the token
                            f.write(word+' B-'+one_entry[1]+'\n')
                            beginning = False
                    #if it's not the first token in this field 
                    else:
                        #if the label is 'O'
                        if one_entry[1] == 'O':
                            #assign 'O' to the token
                            f.write(word+' '+one_entry[1]+'\n')
                        #if not the lable is 'O'
                        else:
                            #assign 'I-label' to the token
                            f.write(word+' I-'+one_entry[1]+'\n')
        #write empty lines to separate citations
        f.write('\n\n')
    #close the output file
    f.close()

#read the styles from command line 
styles = sys.argv[3]
#loop through all the styles 
for style in styles:
    #generate the folder of pdf and txt files 
    if not path.exists('../pdfs/'+style):
        os.mkdir('../pdfs/'+style)
    if not path.exists('../pdfs/'+style+'/'+conf):
        os.mkdir('../pdfs/'+style+'/'+conf)
    if not path.exists('../result/'+style):    
        os.mkdir('../result/'+style)
    if not path.exists('../result/'+style+'/'+conf):    
        os.mkdir('../result/'+style+'/'+conf)
    if not path.exists('../pdfs/'+style+'/'+conf+'/without_key'):
        os.mkdir('../pdfs/'+style+'/'+conf+'/without_key')
    cit_one_conf = []
    #loop through all the bbl file in the input folder 
    for bbl_file in os.listdir(aux_dir+'/aux_file/'+style+'/'+conf):
        if bbl_file[-4:] == '.bbl':
            #create the tex file for generating pdf file
            tex_name = bbl_file[:-4]+'.tex'
            content = temp_content.replace('BBL_NAME', aux_dir+'/aux_file/'+style+'/'+conf+'/'+bbl_file)
            tex=open('tex/'+tex_name,'w')
            tex.write(content)
            tex.close()
            #create command line to generate pdf from bbl
            commandline = 'pdflatex -interaction=nonstopmode -output-directory ../pdfs/'+style+'/'+conf+'/without_key '+'tex/'+tex_name
            cmd = shlex.split(commandline)
            #try to run the command line 
            try:
                result = subprocess.run(cmd)
            #if fails, go to next bbl 
            except Exception:
                continue
            #if the code successfully generate the pdf
            if path.exists('../pdfs/'+style+'/'+conf+'/without_key/'+bbl_file[:-4]+'.pdf'):
                #create the command line to generate txt from pdf
                commandline = 'pdf2txt.py '+'../pdfs/'+style+'/'+conf+'/without_key/'+bbl_file[:-4]+'.pdf'
                cmd = shlex.split(commandline)
                #run the command line to generate citation string 
                result = subprocess.run(cmd,stdout=subprocess.PIPE)
                #read the citation string from stdout
                one_raw_cit = result.stdout.decode('utf-8')
                #extract fields and labels from this citation string
                one_labeled_cit = label_one_cit(one_raw_cit,bbl_file)
                #append the list of fields and labels of one citation to a list
                cit_one_conf.append(one_labeled_cit)
    #generate the labeled citations in CONLL format 
    write_labeled_cit(cit_one_conf,'../result/'+style+'/'+conf+'/output.txt')
   
