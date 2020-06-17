# Bibtex-Fields-Extraction
## Prepare labeled citation strings 
```
cd data
```
### Install requirments
```
pip install requirements.txt
```
### Generate labeled citation strings in CONLL format
#### To assure the quality, there should be only one citation in your BibTex file. You can pick up one style from the provided bst
```
python prepro_bibtex.py <your_bibfile_path> <style>
```
## Pretrain language model use generated citation strings
