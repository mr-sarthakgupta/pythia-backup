#!/bin/bash

# We have 8 GPUs available, but we need only 4 for the current batch sizes.
batch_size=(500 250 100 50 20)

for i in {0..4}; do
  GPU_ID=$((i))  # Shift GPU allocation to 4-7
  CUDA_VISIBLE_DEVICES=$GPU_ID BATCH_SIZE=${batch_size[$i]} MODEL_NUM=$i ./evaluate_memorization.sh &
done

wait  # Wait for all background processes to finish

echo "All evaluations completed."
