# Bibtex-Fields-Extraction
## Prepare labeled citation strings
### This code help you generate labeled citation string in CoNll format from a BibTex file. 
```
cd data
```
## Install requirments
```
pip install requirements.txt
```
## Generate labeled citation strings in CONLL format
### To assure the quality, there should be only one citation in your BibTex file. You can pick up one style from the provided bst
```
python prepro_bibtex.py <your_bibfile_path> <style>
```
