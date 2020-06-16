'''This code is to generated formatted bibtex file and labeled bibtex files'''

import os
import re
import glob
import tqdm
import bibtexparser
from bibtexparser.bparser import BibTexParser
from bibtexparser.bwriter import BibTexWriter
import sys

input_path = sys.argv[1]

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


if __name__ == '__main__':
    #create a bibtex writer 
    writer = BibTexWriter()
    format_errors, parsing_errors = [], []
    #look for all the bib files 
    for fn in glob.iglob(input_path):
        #create new file names 
        formatted_fn = fn.replace('.bib', '.formatted')
        label_fn = fn.replace('.bib', '.label')
        #try to reformnat the original bib file
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
            inject_labels(formatted_fn, label_fn, writer)
        #print out the errors 
        except Exception as e:
            print('#' * 20)
            print(e)
            print(fn)
            parsing_errors.append(fn)
    print(format_errors)
    print(parsing_errors)
