
# Attention Instruction: Amplifying Attention in the Middle via Prompting
This is the code and data to get the results listed in the paper.

## Environment

To set up the environment and install the required dependencies, use the `environment.txt` in the repository

```bash
python -m venv myenv
source myenv/bin/activate 
pip install -r environment.txt
```


## Generate Data
The 3-document data and 9-document data are given in `./data/nq_data`. To regenerate the data or generating data for more document settings, run the following command. The results will be stored in `./data/nq_data` by default.

```bash
python src/generate_data.py --num_total_documents=3 
```

## Inference
To inference the model and generate output files that store the generated answer, run
```bash
sbatch scripts/run_qa_evaluation_zs_model_all_setting.sh
```

The answer will be stored in a new folder `./results/`

If you are not using slurm, refering to the `./scripts/array_job_model_all_setting.txt` for argument settings.

## Evaluate and Visualization
Generate the accuracy heatmap

```bash
sh scripts/get_acc_heatmap.sh
```

Generate the attention weight heatmap

```bash
sh scripts/get_weight_heatmap.sh
```

## Acknowledgements

We would like to acknowledge [lost-in-the-middle](https://github.com/nelson-liu/lost-in-the-middle) for providing the data and code that have inspired and contributed to our work.


