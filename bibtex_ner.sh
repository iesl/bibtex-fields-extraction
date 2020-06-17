DATA_DIR=data-raw/
MODEL_DIR=huggingface/

DATA_DIR=/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/data-raw
#/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/data-raw
#/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/clean_data/mlaa/
#/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/data-raw
MODEL_DIR=/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/huggingface
#LABEL_DIR=/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/data-raw/bibtex-ner
python run_ner.py --data_dir ${DATA_DIR}/bibtex-ner-5M \
                  --model_type roberta \
                  --model_name_or_path roberta-base \
                  --output_dir ${MODEL_DIR}/roberta.ner.base \
                  --labels ${DATA_DIR}/labels.txt \
                  --do_train \
                  --logging_steps 30000 \
                  --save_steps 30000 \
                  --num_train_epochs 3.0 \
                  --per_gpu_train_batch_size 6 \
                  --max_seq_length 512
