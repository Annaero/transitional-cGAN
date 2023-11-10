This repo is a bit siplified fork of the original https://github.com/mshahbazi72/transitional-cGAN for the specific case of geometric-shapes-mathematics dataset. 

All results were obtained using docker image nvcr.io/nvidia/pytorch:20.12-py3

*ℹ️* Generates images of size 256x256
*⚠️ WARNING!* this repo contains large checkpoints files. Unfortunately github does not allows to use git-lfs with public forks :(

# Generate images with pretrained models
Download checkpoint [network-snapshot-003800.pkl](https://drive.google.com/file/d/1lKRhnbjQM8birI_X12JDd3L4ePvVfMDO/view?usp=sharing) and place it into `checkpoints` folder on the project root.

```bash
scripts/generate_shapes.sh [CLASS_NAME] [SAMPLES=4]
```

Where CLASS_NAME is any class name from the geometric-shapes-mathematics dataset and SAMPLES is optional(default=4) number of images to generate.

E.g.

```bash
scripts/generate_shapes.sh circle 5
```

# Train
## Prepare dataset
Download dataset from https://www.kaggle.com/datasets/reevald/geometric-shapes-mathematics and extractr archive to `datasets` folder with name `geometric-shapes`.
Run dataset preparation script 
```bash
    ./scripts/prepare_dataset_shapes.sh
```

## Train
_Optional:_ install wandb to track training process and login using your credentials
```bash
    pip install wandb
    wandb login
```

Run training 
```bash
    ./scripts/train_shapes.sh
```

Model checkpoint will be saved to the `./output/%training_name%`