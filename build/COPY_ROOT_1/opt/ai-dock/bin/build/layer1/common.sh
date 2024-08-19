#!/bin/false

source /opt/ai-dock/etc/environment.sh

build_common_main() {
    # Nothing to do
    :
}

build_common_install_forge() {
    # Get latest tag from GitHub if not provided
    if [[ -z $FORGE_BUILD_REF ]]; then
        export FORGE_BUILD_REF="$(curl -s https://api.github.com/repos/lllyasviel/stable-diffusion-webui-forge/tags | \
            jq -r '.[0].name')"
        env-store FORGE_BUILD_REF
    fi

    cd /opt
    git clone https://github.com/lllyasviel/stable-diffusion-webui-forge
    cd /opt/stable-diffusion-webui-forge
    git checkout "$FORGE_BUILD_REF"
    
    "$FORGE_VENV_PIP" install --no-cache-dir -r requirements_versions.txt
}

build_common_run_tests() {
    installed_pytorch_version=$("$FORGE_VENV_PYTHON" -c "import torch; print(torch.__version__)")
    echo "Checking PyTorch version contains ${PYTORCH_VERSION}..."
    if [[ "$installed_pytorch_version" != "$PYTORCH_VERSION"* ]]; then
        echo "Expected PyTorch ${PYTORCH_VERSION} but found ${installed_pytorch_version}\n"
        exit 1
    fi
    echo "Found PyTorch ${PYTORCH_VERSION}. Success!"
}

build_common_main "$@"