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
### 1) Requirements and Installation
* [PyTorch](http://pytorch.org/) version >= 1.4.0
* Python version >= 3.6
* For training new models, you'll also need an NVIDIA GPU and [NCCL](https://github.com/NVIDIA/nccl)
* **To install fairseq** and develop locally:
```bash
git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable ./
```
### 2) Preprocess/binarize the BibTex-41M data
```
data_dir='data-raw'
dataset_dir=${data_dir}/bibtex-raw
fairseq-preprocess \
    --only-source \
    --srcdict $dataset_dir/dict.txt \
    --trainpref $dataset_dir/train.bpe \
    --validpref $dataset_dir/dev.bpe \
    --destdir <your_destdir> \
    --workers 60
```
### 3) Train a language model
```
TOTAL_UPDATES=125000   # Total number of training steps
WARMUP_UPDATES=10000    # Warmup the learning rate over this many updates
PEAK_LR=0.0005          # Peak learning rate, adjust as needed
TOKENS_PER_SAMPLE=512   # Max sequence length
MAX_POSITIONS=512       # Num. positional embeddings (usually same as above)
MAX_SENTENCES=4         # Number of sequences per batch (batch size)
UPDATE_FREQ=16          # Increase the batch size 16x
SAVE_FREQ=1024

DATA_DIR=data-bin/$1

fairseq-train $DATA_DIR \
    --task masked_lm --criterion masked_lm \
    --arch roberta_base --sample-break-mode complete --tokens-per-sample $TOKENS_PER_SAMPLE \
    --optimizer adam --adam-betas '(0.9,0.98)' --adam-eps 1e-6 --clip-norm 5.0 \
    --lr-scheduler polynomial_decay --lr $PEAK_LR --warmup-updates $WARMUP_UPDATES --total-num-update $TOTAL_UPDATES \
    --dropout 0.1 --attention-dropout 0.1 --weight-decay 0.01 \
    --max-sentences $MAX_SENTENCES --update-freq $UPDATE_FREQ \
    --max-update $TOTAL_UPDATES --log-format simple --log-interval 1 \
    --skip-invalid-size-inputs-valid-test --save-interval-updates $SAVE_FREQ \
    --restore-file models/roberta.$1/checkpoint_last.pt --save-dir models/roberta.$1 --tensorboard-logdir logs/roberta.$1 \
    --ddp-backend=no_c10d
```

