""" 
This code is to generate bbl files from bib files 
"""
import re
import glob
import os
import sys
import subprocess
import shlex
from subprocess import Popen, PIPE
from os import path
#input path for the bibs
bib_file = sys.argv[1]
#specify the styles
style = sys.argv[2]
# create path for the aux file
if not path.exists('aux_file/'):
    os.mkdir('aux_file/')
#assign the input path
style_directory='bst/'
#read the temp aux file
temp_aux = open('templates/temp.aux').read()
#create aux files for generating bbl files 
one_aux = open('aux_file/'+bib_file[:-4]+'.aux','w+')
#replace the file name and style name with the input bib file and the style 
content = temp_aux.replace('BIB',bib_file[:-4])
content = content.replace('STYLE',style_directory+style)
#write the content into a new aux file
one_aux.write(content)
one_aux.close()
#create the pytex command to generate bbl files 
commandline = 'pybtex -e ISO-8859-1 aux_file/'+bib_file[:-4]+'.aux'
cmd = shlex.split(commandline)
#run the command in a subprocess
result = subprocess.run(cmd)   
