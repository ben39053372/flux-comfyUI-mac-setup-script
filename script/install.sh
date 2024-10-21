name=flux-comfyUI-mac-setup-script

# install miniconda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
sh Miniconda3-latest-MacOSX-arm64.sh -u
rm Miniconda3-latest-MacOSX-arm64.sh

clear

echo "Create environment"

echo $name

# create env 
conda create --name $name 

conda activate flux-comfyUI-mac-setup-script

clear

#  === install pytorch === 

echo "=== install pytorch ==="

conda install pytorch torchvision torchaudio -c pytorch-nightly

if python verifyPytorch.py | grep -q "tensor";
then 
  echo " Verify Pytorch Success! "
else 
  echo " Verify Pytorch Fail! "
  exit 1
fi

clear
echo "clone ComfyUI"

# install ComfyUI
if [ ! -e ComfyUI ]
then
  git clone https://github.com/comfyanonymous/ComfyUI.git
else
  echo "==== already clone ComfyUI ! ===="
  (cd ComfyUI && git pull)
fi

echo "install ComfyUI package"

(cd ComfyUI && pip install -r requirements.txt)


