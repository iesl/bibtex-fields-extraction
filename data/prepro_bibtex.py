'''This code is to generated formatted bibtex file and labeled bibtex files'''

import os
import re
import glob
import tqdm
import bibtexparser
from bibtexparser.bparser import BibTexParser
from bibtexparser.bwriter import BibTexWriter
import sys
import subprocess
import shlex
from subprocess import Popen, PIPE
from os import path
from collections import OrderedDict
from personalnames import names



#input bibtex path
input_path = sys.argv[1]

#specify the styles
style = sys.argv[2]

#Check if all the entries in on bibtex item are properly quoted
def is_quoted(value):
    for open_char, close_char in {'"': '"', "'": "'", '{': '}'}.items():
        if value.startswith(open_char) and value.endswith(close_char):
            return True
    return False

#get the values from each entry 
def get_quoted_value(value):
    open_char = '' if value.startswith('"') else '"'
    close_char = '' if value.endswith('"') else '"'
    return '{}{}{}'.format(open_char, value, close_char)

#This function helps to remformat bibtex files for generating bbl files
def reformat_bib_file(input_fn, output_fn):
    #open one bibtex file 
    with open(input_fn, 'r', encoding='ISO-8859-1') as bib_file, \
            open(output_fn, 'w', encoding='ISO-8859-1') as out_file:
        variables = {}
        #this function actually helps to reformate each entry of bibtex items
        def reformat_bib_entry(bib_str):
            #if bibtex starts with @string, this bibtex contrains the full text of a abbreviation 
            if bib_str.startswith('@string') or bib_str.startswith('@STRING'):
                #extract abbreviation and full text
                for m in re.finditer(r'@string[\(\{]\s*(\w+).*=.(".+")', bib_str, flags=re.IGNORECASE):
                    assert len(m.groups()) == 2
                    key, val = m.groups()
                    #key is the abbreviation and value is the full text
                    variables[key] = val
                return ''
                # if the bibtext item does not start with @string
            else:
                key_spans = []
                #find the starting and ending index of one entry 
                for m in re.finditer(r',[\s\n]*(\w+)\s*=', bib_str, flags=re.MULTILINE):
                    key_spans.append((m.start(), m.end()))
                sub = {}
                #extract the value of one entry from one bibtex string 
                for span1, span2 in zip(key_spans, key_spans[1:]):
                    val = bib_str[span1[1]:span2[0]].strip()
                    #if the value in the entry is quoted continue
                    if is_quoted(val):
                        continue
                    #if the value is not quoted, this value is an abbreviation 
                    if val in variables:
                        #look for the full text of this entry
                        sub[val] = variables[val]
                    else:
                        #if this value is not in the lookup table, add quote to this value
                        sub[val] = get_quoted_value(val)
                #if there is only one entry in the bibtex item
                if len(key_spans) == 0:
                    last_val = bib_str
                #this is to handle the last entry there is a extra } at the end 
                else:
                    last_span = span2 if len(key_spans) > 1 else key_spans[0]
                    last_val = bib_str[last_span[1]:]
                    for idx, ch in enumerate(last_val[::-1]):
                        if ch in ')}':
                            last_val = last_val[:-idx-1].strip()
                            break
                    #if there is a comma between } and }, remove the comma
                    last_val = last_val[:-1].strip() if last_val[-1] == ',' else last_val
                #if the value is not quoted add quate to it 
                if not is_quoted(last_val):
                    sub[last_val] = get_quoted_value(last_val)
                #replace the original values in the bibtex with the formated string
                for k, v in sub.items():
                    bib_str = bib_str.replace(k, v)
            return bib_str

        bib_str = ''
        for line in bib_file:
            #find bibtex items in the bib file 
            if (line.startswith('@') or line.startswith('%')) and bib_str.strip() != '':
                #format the bibtex item's entries 
                formatted_str = reformat_bib_entry(bib_str.lstrip())
                #if the output bibtex item is not empty 
                if formatted_str.strip() != '':
                    #write the formated bibtex into output file
                    out_file.write(formatted_str)
                    out_file.write('\n')
                bib_str = line if line.startswith('@') else ''
            #if it's not a bibtex item 
            elif line.rstrip().strip() != '':
                #collect it
                bib_str += line
        if bib_str.strip() != '':
            #reformat the string
            formatted_str = reformat_bib_entry(bib_str.lstrip())
            if formatted_str.strip() != '':
                #write it into the output file
                out_file.write(formatted_str)
                out_file.write('\n')

#this function is to add the label into each entry 
def inject_labels(input_fn, output_fn, writer):
    #open the reformated bibtex file 
    with open(input_fn, encoding='ISO-8859-1') as bibtex_file:
        #setup the parser for bibtex 
        parser = BibTexParser(common_strings=True)
        parser.ignore_nonstandard_types = True
        parser.homogenise_fields = False
        bib_database = bibtexparser.loads(bibtex_file.read(), parser)
        #the format of the bibtex database is a list of dictionary 
        entries = bib_database.entries
        new_entries = []
        for entry in entries:
            new_entry = {}
            #The key is the label and the val is the value in each entry
            for key, val in entry.items():
                #ignor the labels of id, entrytype and author 
                if not key.lower() in ['id', 'entrytype', 'author']:
                    #append begining and ending labels to the value string
                    new_entry[key] = '@@@{}@@@ {} @@@@{}@@@@'.format(key, val, key)
                else:
                    #assign the new value to the key
                    new_entry[key] = val
            new_entries.append(new_entry)
        #assign the new entries to the database 
        bib_database.entries = new_entries
    #write the labeled bibtex file into the output file
    with open(output_fn, 'w') as out_file:
        out_file.write(writer.write(bib_database))

#this function is used to collect author's name
def collect_author_name(fn):
    writer = BibTexWriter()
    #create the  output file 
    output = fn.replace('.bib','.author')
    #open the output file 
    output_file = open(output,'w+')
    #open the bibtex file 
    with open(fn, encoding='ISO-8859-1') as bibtex_file:
        #read the bibtex file into a list of dictionary 
        parser = BibTexParser(common_strings=True)
        parser.ignore_nonstandard_types = True
        parser.homogenise_fields = False
        bib_database = bibtexparser.loads(bibtex_file.read(), parser)
        entries = bib_database.entries
        #for each bibtex item
        for entry in entries:
            #go through all the entries  
            for key, val in entry.items():
                #if the label for this entry is author 
                if key.lower()=='author':
                    all_authors = val.split('and')
                    #write all the values in this entry to authors' name file
                    for one_author in all_authors:
                        one_author = one_author.strip()
                        output_file.write(one_author+'\n')
        print(format_errors)
        print(parsing_errors)
    return output

#this function is used to generate bbl
def generate_bbl(fn):
    # create path for the aux file
    if not path.exists('aux_file/'):
        os.mkdir('aux_file/')
    #assign the input path
    style_directory='bst/'
    #read the temp aux file
    temp_aux = open('templates/temp.aux').read()
    bib_name = fn.split('/')[-1][:-4]
    #create aux files for generating bbl files 
    one_aux = open('aux_file/'+bib_name+'.aux','w+')
    #replace the file name and style name with the input bib file and the style 
    content = temp_aux.replace('BIB',fn[:-4])
    content = content.replace('STYLE',style_directory+style)
    #write the content into a new aux file
    one_aux.write(content)
    one_aux.close()
    #create the pytex command to generate bbl files 
    commandline = 'pybtex -e ISO-8859-1 aux_file/'+bib_name+'.aux'
    cmd = shlex.split(commandline)
    #run the command in a subprocess
    result = subprocess.run(cmd) 
    return 'aux_file/'+bib_name+'.bbl'

def generate_labeled_cit(bbl_file,author_file,style):
    #this function is to extract fields of in a citation string and 
    # store them in a list 
    def label_one_cit(cit,bbl_file):
        #read authors' name for the corrent bbl file
        author_names = open(author_file).read().strip()
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
    def write_labeled_cit(one_labeled_cit,_Path_):
        #open the output file 
        f = open( _Path_ ,'w+')
        #loop through all citations
        for one_entry in one_labeled_cit:
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
        #close the output file
        f.close()
    tex_name = bbl_file[:-4]+'.tex'
    temp_content = open("templates/temp.tex", 'r').read()
    content = temp_content.replace('BBL_NAME', 'aux_file/'+bbl_file)
    if not path.exists('tex/'):
        os.mkdir('tex/')
    tex=open('tex/'+tex_name,'w')
    tex.write(content)
    tex.close()
    #generate pdf dir
    if not path.exists('pdfs'):
        os.mkdir('pdfs')
    #create command line to generate pdf from bbl
    commandline = 'pdflatex -interaction=nonstopmode -output-directory pdfs tex/'+tex_name
    cmd = shlex.split(commandline)
    #try to run the command line 
    try:
        result = subprocess.run(cmd)
    #if fails, go to next bbl 
    except Exception as e:
        print('#' * 20)
        print(e)
    #convert pdf to txt
    pdf_name = bbl_file[:-4]+'.pdf'
    #create the command line to generate txt from pdf
    commandline = 'pdf2txt.py '+'pdfs/' + pdf_name
    cmd = shlex.split(commandline)
    #create output file
    if not path.exists('output'):
        os.mkdir('output')
    try:
        #run the command line to generate citation string 
        result = subprocess.run(cmd,stdout=subprocess.PIPE)
        #read the citation string from stdout
        one_raw_cit = result.stdout.decode('utf-8')
        one_labeled_cit = label_one_cit(one_raw_cit,bbl_file)
        write_labeled_cit(one_labeled_cit,'output/'+bbl_file[:-4]+'.conll')
    except Exception as e:
        print('#' * 20)
        print(e)


if __name__ == '__main__':
    #create a bibtex writer 
    writer = BibTexWriter()
    format_errors, parsing_errors = [], []
    fn = input_path
    #create new file names 
    formatted_fn = fn.replace('.bib', '.formatted')
    label_fn = fn.replace('.bib', '.label')
    #try to reformnat the original bib file
    author_file = collect_author_name(fn)
    try:
        reformat_bib_file(fn, formatted_fn)
    #print out the errors
    except Exception as e:
        print('#' * 20)
        print(e)
        print(fn)
        format_errors.append(fn)
    #try to lable the reformatted bib files 
    try:
        inject_labels(formatted_fn, fn, writer)
    #print out the errors 
    except Exception as e:
        print('#' * 20)
        print(e)
        print(fn)
        parsing_errors.append(fn)
    #generate bbl file
    bbl_file = generate_bbl(fn)
    #generate labeled cit
    generate_labeled_cit(bbl_file.split('/')[-1],author_file,style)