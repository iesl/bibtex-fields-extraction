# Bibtex-Fields-Extraction
## Prepare labeled citation strings 
1. Go to data directory
```
cd data
```
2. Install requirments
```
pip install requirements.txt
```
3. Generate labeled citation strings in CONLL format. (To assure the quality, there should be only one citation in your BibTex file. You can pick up one style from the provided bst)
```
python prepro_bibtex.py <your_bibfile_path> <style>
```
## Pretrain language model use generated citation strings
### Requirements and Installation

* [PyTorch](http://pytorch.org/) version >= 1.4.0
* Python version >= 3.6
* For training new models, you'll also need an NVIDIA GPU and [NCCL](https://github.com/NVIDIA/nccl)
* **To install fairseq** and develop locally:
```bash
git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable ./
