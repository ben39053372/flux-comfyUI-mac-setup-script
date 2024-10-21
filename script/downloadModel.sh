# download checkpoints

clear 
echo "download models ... "

conda activate flux-comfyUI-mac-setup-script

# flux1 dev fp8
if [ ! -e ComfyUI/models/checkpoints/flux1-dev-fp8.safetensors ]
then
  echo "download flux1-dev-fp8.safetensors to ComfyUI/models/checkpoints" 
  (cd ComfyUI/models/checkpoints && curl -L -O https://huggingface.co/lllyasviel/flux1_dev/resolve/main/flux1-dev-fp8.safetensors)
else
  echo "SKIP: download flux1-dev-fp8.safetensors"
fi

# ae
if [ ! -e ComfyUI/models/vae/ae.safetensors ]
then
  echo "download ae.safetensors to ComfyUI/models/vae ... "
  (cd ComfyUI/models/vae && curl -L -O https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors)
else
  echo "SKIP: download ae.safetensors"
fi

# flux.1-schnell-gguf
if [ ! -e ComfyUI/models/unet/flux1-schnell-Q4_0.gguf ]
then
  echo "download flux1-schnell-Q4_0.gguf to ComfyUI/models/unet ... "
  (cd ComfyUI/models/unet && curl -L -O https://huggingface.co/city96/FLUX.1-schnell-gguf/resolve/main/flux1-schnell-Q4_0.gguf)
else
  echo "SKIP: download flux1-schnell-Q4_0.gguf"
fi

# clip
# t5xxl_fp8_e4m3fn
if [ ! -e ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors ]
then
  echo "download t5xxl_fp8_e4m3fn.safetensors to ComfyUI/models/clip ..."
  (cd ComfyUI/models/clip && curl -L -O https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors)
else
  echo "SKIP: download t5xxl_fp8_e4m3fn.safetensors"
fi

if [ ! -e ComfyUI/models/clip/clip_l.safetensors ]
then
  echo "download clip_l.safetensors to ComfyUI/models/clip ..."
  (cd ComfyUI/models/clip && curl -L -O https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors)
else
  echo "SKIP: download clip_l.safetensors "
fi

# install gguf custom_nodes
if [ ! -e ComfyUI/custom_nodes/ComfyUI-GGUF ]
then
  echo "git clone ComfyUI-GGUF custome_nodes"
  (cd ComfyUI/custom_nodes && git clone https://github.com/city96/ComfyUI-GGUF.git && cd ComfyUI-GGUF && pip install -r requirements.txt)
else
  (cd ComfyUI/custom_nodes/ComfyUI-GGUF && pip install -r requirements.txt)
  echo "SKIP: clone ComfyUI-GGUF"
fi