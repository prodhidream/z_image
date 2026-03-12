# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Skipping unknown registry custom nodes that have no aux_id:
# RUN # Could not resolve unknown custom node: MarkdownNote (no aux_id provided)
# RUN # Could not resolve unknown custom node: MarkdownNote (no aux_id provided)
# RUN # Could not resolve unknown custom node: MarkdownNote (no aux_id provided)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image/blob/main/split_files/diffusion_models/z_image_bf16.safetensors --relative-path models/diffusion_models --filename z_image_bf16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/blob/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
