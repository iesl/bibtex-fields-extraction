import jsonlines
import sys 
import re


prediction_filename = sys.argv[1]
target_filename = sys.argv[2]

if 'jsonl' in prediction_filename:
    prediction = []
    with jsonlines.open(prediction_filename) as json_data:
        for obj in json_data:
            prediction.append(list(zip(obj["words"], obj["tags"])))
    output_filename = prediction_filename.replace('jsonl', 'txt')
else:
    prediction_data = open(prediction_filename).read().strip().split('\n\n')
    prediction = [[e.split() for e in x.split('\n')] for x in prediction_data]
    output_filename = sys.argv[3]

target_data = open(target_filename).read().strip().split('\n\n')
target = [x.split('\n') for x in target_data]
if len(prediction) != len(target):
    new_target = []
    for citation in prediction:
        while len(target) > 0:
            skip = False
            gt_citation = target.pop(0)
            for pd, gt in zip(citation, gt_citation):
                if len(pd) == 0:
                    continue
                if pd[0] != gt.split()[0]:
                    skip = True
                    break
            if not skip:
                new_target.append(gt_citation.copy())
                break
    target = new_target
assert len(prediction) == len(target)            

with open(output_filename, 'w') as output:
    correct_gt = correct_tag = False
    for pred_citation, gt_citation in zip(prediction, target):
        for pred, gt in zip(pred_citation, gt_citation):
            if len(pred) == 0:
                continue
            word, tag = pred
            #print(gt)
            _, gt_tag = gt.split()
            if len(word) > 1:
                if correct_gt:
                    gt_tag = 'B' + gt_tag[1:] if gt_tag != 'O' else gt_tag
                    correct_gt = False
                if correct_tag:
                    tag = 'B' + tag[1:] if tag != 'O' else tag
                    correct_tag = False
                output.write('{}\t{}\t{}\n'.format(word, gt_tag, tag))
            else:
                correct_gt = gt_tag[0] == 'B'
                correct_tag = tag[0] == 'B'
        output.write('\n')

