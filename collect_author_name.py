"""
This code is to collect authors' names which will be used latter.
The authors' names file will be stored in the same folder as the bib files.
"""
import os
import re
import glob
import tqdm
import bibtexparser
from bibtexparser.bparser import BibTexParser
from bibtexparser.bwriter import BibTexWriter
import sys

# input bib file path 
fn = sys.argv[1]
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
        
