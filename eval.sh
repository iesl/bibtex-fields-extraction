DATA_DIR=data-raw/roberta.ner
MODEL_DIR=huggingface/

python run_ner.py --data_dir ${DATA_DIR}/bibtex-ner-umass \
                  --model_type roberta \
                  --model_name_or_path ${MODEL_DIR}/roberta.5M.bibtex.umass \
                  --output_dir ${MODEL_DIR}/roberta.5M.bibtex.umass \
                  --labels ${DATA_DIR}/labels.txt \
                  --do_predict \
                  --logging_steps 10000 \
                  --save_steps 10000 \
                  --num_train_epochs 3.0 \
                  --per_gpu_train_batch_size 8 \
                  --max_seq_length 512
