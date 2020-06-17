dataset_dir=data-raw/bibtex-raw

fairseq-preprocess \
    --only-source \
    --srcdict $dataset_dir/dict.txt \
    --trainpref $dataset_dir/train.bpe \
    --validpref $dataset_dir/dev.bpe \
    --destdir data-bin/bibtex \
    --workers 60
