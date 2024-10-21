source activate base
conda activate flux-comfyUI-mac-setup-script

PYTORCH_ENABLE_MPS_FALLBACK=1 TOKENIZERS_PARALLELISM=true python ComfyUI/main.py --force-upcast-attention