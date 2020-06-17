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
## Pretrain a RoBERTa language model using generated citation strings
1. Requirements and Installation
* [PyTorch](http://pytorch.org/) version >= 1.4.0
* Python version >= 3.6
* For training new models, you'll also need an NVIDIA GPU and [NCCL](https://github.com/NVIDIA/nccl)
* **To install fairseq** and develop locally:
```bash
git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable ./
```
2. Preprocess/binarize the BibTex-41M data. Download the corpus of BibTex-41M and put it in data-raw direcory.
```
./preprocess.sh
```
3. Train a language model. 
```
./pretrain.sh
```
4. Convert fairseq roberta checkpoint to pytorch
```
python convert_checkpoint.py --roberta_checkpoint_path models/roberta.bibtex/checkpoint_last.pt --pytorch_dump_folder_path hugginface/roberta.bibtex
```
## Train a RoBERTa NER model using labeled citation strings
1. Train a RoberTa BibTex NER model
```
./bibtex_ner.sh
```
2. Fine-tune BibTex NER model on UMass CFE dataset
```
./umass_ner.sh
```
## Evaluate the performance on UMass CFE dataset
1. Generate prediction
```
./eval.sh
```
2. Compute recall, precision and F1 score 

