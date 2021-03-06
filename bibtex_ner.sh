DATA_DIR=data-raw/
MODEL_DIR=huggingface/

python run_ner.py --data_dir ${DATA_DIR}/bibtex-ner-5M \
                  --model_type roberta \
                  --model_name_or_path ${MODEL_DIR}/roberta.5M \
                  --output_dir ${MODEL_DIR}/roberta.5M.bibtex \
                  --labels ${DATA_DIR}/labels.txt \
                  --do_train \
                  --logging_steps 30000 \
                  --save_steps 30000 \
                  --num_train_epochs 3.0 \
                  --per_gpu_train_batch_size 6 \
                  --max_seq_length 512
