FROM rocm/pytorch-training:v25.2
ENV COMFYUI_PATH=/workload/ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git $COMFYUI_PATH && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager $COMFYUI_PATH/custom_nodes/comfyui-manager && \
    git clone https://github.com/rgthree/rgthree-comfy.git $COMFYUI_PATH/custom_nodes/rgthree-comfy
RUN pip install --upgrade pip
RUN pip install -r $COMFYUI_PATH/requirements.txt && \
    pip install --upgrade --no-deps --force-reinstall torch torchvision torchaudio --index-url https://download.pytorc>
    pip install -r $COMFYUI_PATH/custom_nodes/comfyui-manager/requirements.txt
CMD ["/bin/bash"]
