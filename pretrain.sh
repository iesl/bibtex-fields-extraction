TOTAL_UPDATES=125000   
WARMUP_UPDATES=10000    
PEAK_LR=0.0005          
TOKENS_PER_SAMPLE=512  
MAX_POSITIONS=512       
MAX_SENTENCES=4         
UPDATE_FREQ=16          
SAVE_FREQ=1024

DATA_DIR=data-bin/bibtex

fairseq-train $DATA_DIR \
    --task masked_lm --criterion masked_lm \
    --arch roberta_base --sample-break-mode complete --tokens-per-sample $TOKENS_PER_SAMPLE \
    --optimizer adam --adam-betas '(0.9,0.98)' --adam-eps 1e-6 --clip-norm 5.0 \
    --lr-scheduler polynomial_decay --lr $PEAK_LR --warmup-updates $WARMUP_UPDATES --total-num-update $TOTAL_UPDATES \
    --dropout 0.1 --attention-dropout 0.1 --weight-decay 0.01 \
    --max-sentences $MAX_SENTENCES --update-freq $UPDATE_FREQ \
    --max-update $TOTAL_UPDATES --log-format simple --log-interval 1 \
    --skip-invalid-size-inputs-valid-test --save-interval-updates $SAVE_FREQ \
    --restore-file models/roberta.bibtex/checkpoint_last.pt --save-dir models/roberta.bibtex --tensorboard-logdir logs/roberta.bibtex \
    --ddp-backend=no_c10d
