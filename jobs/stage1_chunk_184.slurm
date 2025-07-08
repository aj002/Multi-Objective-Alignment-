#!/bin/bash
#SBATCH --job-name=stage1_chunk_184
#SBATCH --output=logs/stage1_chunk_184_%j.out
#SBATCH --error=logs/stage1_chunk_184_%j.err
#SBATCH --partition=seasdean1
#SBATCH --account=seasdean
#SBATCH --gres=gpu:1
#SBATCH --time=25:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G

source ~/.bashrc
conda activate constitutional-ai

python stage1_pipeline.py \
    --prompt_file prompt_chunks/chunk_264.txt \
    --output_file outputs/responses_chunk_184.jsonl \
    --model_name Qwen/Qwen1.5-0.5B \
    --constitution_path constitution.json \
    --revision_steps 2 \
    --device 0 \
    --batch_size 8
