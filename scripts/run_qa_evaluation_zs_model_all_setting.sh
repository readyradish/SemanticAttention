#!/bin/bash

#SBATCH --job-name=eval_tulu
# %A is being automatically replaced with the job ID, while %a is the index of the job within the array
#SBATCH --output=eval_model_%A_%a.out
#SBATCH --error=eval_model_%A_%a.err
# means using line 1 to 4 in the hyperparameter file, run maximum 2 jobs in parallel at the same time, 
#SBATCH --array=1-5
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1


JOB_FILE=run_qa_evaluation_zs_model_all_setting.sh
HPARAMS_FILE=array_job_model_all_setting.txt

# run with different number of documents and models
# with 3-documents and 9-documents
# inference other models 
# "Llama-2-7b-chat-hf" "Meta-Llama-3-8B-Instruct" "Mistral-7B-Instruct-v0.2" "Mistral-7B-Instruct-v0.1"

for num_docs in 3 9
    do
    for model_name in "tulu-2-7b"
        do
        python -u ../src/get_qa_responses.py \
            --num-docs $num_docs \
            --max-new-tokens 100 \
            --num-gpus 1 \
            --model $model_name \
            $(head -$SLURM_ARRAY_TASK_ID $HPARAMS_FILE | tail -1)
        done
    done

