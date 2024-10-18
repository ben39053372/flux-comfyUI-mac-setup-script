name=flux-comfyUI-mac-setup-script

# install miniconda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
sh Miniconda3-latest-MacOSX-arm64.sh -u
rm Miniconda3-latest-MacOSX-arm64.sh

echo $name

# create env 
conda create --name $name 

source activate $name

# install pytorch
conda install pytorch torchvision torchaudio -c pytorch-nightly

python verifyPytorch.py

# clone ComfyUI
git clone https://github.com/comfyanonymous/ComfyUI.git

(cd ComfyUI && pip install -r requirements.txt)

