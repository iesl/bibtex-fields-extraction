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
2. Preprocess/binarize the BibTex-41M data. Download BibTex-41M.
```
dataset_dir=data-raw/bibtex-raw
fairseq-preprocess \
    --only-source \
    --srcdict $dataset_dir/dict.txt \
    --trainpref $dataset_dir/train.bpe \
    --validpref $dataset_dir/dev.bpe \
    --destdir data-bin/bibtex \
    --workers 60
```
3. Train a language model. 
```
TOTAL_UPDATES=125000   
WARMUP_UPDATES=10000    
PEAK_LR=0.0005          
TOKENS_PER_SAMPLE=512  
MAX_POSITIONS=512       
MAX_SENTENCES=4         
UPDATE_FREQ=16          
SAVE_FREQ=1024

DATA_DIR=<your_data_dir>
MODEL_DIR=<your_model_dir>

fairseq-train $DATA_DIR \
    --task masked_lm --criterion masked_lm \
    --arch roberta_base --sample-break-mode complete --tokens-per-sample $TOKENS_PER_SAMPLE \
    --optimizer adam --adam-betas '(0.9,0.98)' --adam-eps 1e-6 --clip-norm 5.0 \
    --lr-scheduler polynomial_decay --lr $PEAK_LR --warmup-updates $WARMUP_UPDATES --total-num-update $TOTAL_UPDATES \
    --dropout 0.1 --attention-dropout 0.1 --weight-decay 0.01 \
    --max-sentences $MAX_SENTENCES --update-freq $UPDATE_FREQ \
    --max-update $TOTAL_UPDATES --log-format simple --log-interval 1 \
    --skip-invalid-size-inputs-valid-test --save-interval-updates $SAVE_FREQ \
    --restore-file models/$MODEL_DIR/checkpoint_last.pt --save-dir models/$MODEL_DIR --tensorboard-logdir logs/$MODEL_DIR \
    --ddp-backend=no_c10d
```
4. Train a BibTex NER model
```
DATA_DIR=<your_data_path>
MODEL_DIR=<your_output_model_path>

python run_ner.py --data_dir ${DATA_DIR} \
                  --model_type roberta \
                  --model_name_or_path  \
                  --output_dir \
                  --labels ${DATA_DIR}/labels.txt \
                  --do_predict \
                  --logging_steps 10000 \
                  --save_steps 10000 \
                  --num_train_epochs 3.0 \
                  --per_gpu_train_batch_size 8 \
                  --max_seq_length 512
 ```                 
5. Evaluate BibTex NER model
```
DATA_DIR=${WORKING_DIR}/data-raw
MODEL_DIR=${WORKING_DIR}/huggingface

python run_ner.py --data_dir ${DATA_DIR}/$1 \
                  --model_type roberta \
                  --model_name_or_path ${MODEL_DIR}/roberta.ner.pretrained-math/ \
                  --output_dir ${MODEL_DIR}/roberta.ner.pretrained-math \
                  --labels ${DATA_DIR}/labels.txt \
                  --do_predict \
                  --logging_steps 10000 \
                  --save_steps 10000 \
                  --num_train_epochs 3.0 \
                  --per_gpu_train_batch_size 8 \
                  --max_seq_length 512
```
