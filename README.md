# Genkai Tutorial

## Setup
Create an environment using
```
ssh genkai
cd genkai-tutorial
conda create -n genkai python=3.9
conda activate genkai
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install -r requirements.txt
```
## Job Exection
```
pjsub run.sh
```
## Job Statas
```
pjstat
```
