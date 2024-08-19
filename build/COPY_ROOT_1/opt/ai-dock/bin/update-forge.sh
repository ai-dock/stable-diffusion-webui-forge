#!/bin/bash
umask 002

source /opt/ai-dock/bin/venv-set.sh forge

if [[ -n "${FORGE_REF}" ]]; then
    ref="${FORGE_REF}"
else
    # The latest tagged release
    ref="$(curl -s https://api.github.com/repos/lllyasviel/stable-diffusion-webui-forge/tags | \
            jq -r '.[0].name')"
fi

# -r argument has priority
while getopts r: flag
do
    case "${flag}" in
        r) ref="$OPTARG";;
    esac
done

[[ -n $ref ]] || { echo "Failed to get update target"; exit 1; }

printf "Updating WebUI Forge (${ref})...\n"

cd /opt/stable-diffusion-webui-forge
git fetch --tags
git checkout ${ref}
git pull

"$FORGE_VENV_PIP" install --no-cache-dir -r requirements.txt
