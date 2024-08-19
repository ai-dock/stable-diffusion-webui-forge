[![Docker Build](https://github.com/ai-dock/stable-diffusion-webui-forge/actions/workflows/docker-build.yml/badge.svg)](https://github.com/ai-dock/stable-diffusion-webui/actions/workflows/docker-build.yml)

# Stable Diffusion WebUI Forge Docker Image

Run [Stable Diffusion WebUI Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) in a docker container locally or in the cloud.

>[!NOTE]  
>These images do not bundle models or third-party configurations. You should use a [provisioning script](https://github.com/ai-dock/base-image/wiki/4.0-Running-the-Image#provisioning-script) to automatically configure your container. You can find examples in `config/provisioning`.

## Documentation

All AI-Dock containers share a common base which is designed to make running on cloud services such as [vast.ai](https://link.ai-dock.org/vast.ai) as straightforward and user friendly as possible.

Common features and options are documented in the [base wiki](https://github.com/ai-dock/base-image/wiki) but any additional features unique to this image will be detailed below.


#### Version Tags

The `:latest` tag points to `:latest-cuda`

Tags follow these patterns:

##### _CUDA_
- `:v2-cuda-[x.x.x]-[base|runtime]-[ubuntu-version]`

- `:latest-cuda` &rarr; `:v2-cuda-12.1.1-base-22.04`

##### _ROCm_
- `:rocm-[x.x.x]-runtime-[ubuntu-version]`

- `:latest-rocm` &rarr; `:v2-rocm-6.0-core-22.04`

##### _CPU_
- `:cpu-ubuntu-[ubuntu-version]`

- `:latest-cpu` &rarr; `:v2-cpu-22.04` 

Browse [ghcr.io](https://github.com/ai-dock/stable-diffusion-webui-forge/pkgs/container/stable-diffusion-webui) for an image suitable for your target environment. Alternatively, view a select range of [CUDA](https://hub.docker.com/r/aidockorg/stable-diffusion-webui-forge-cuda) and [ROCm](https://hub.docker.com/r/aidockorg/stable-diffusion-webui-forge-rocm) builds at DockerHub.

Supported Python versions: `3.10`

Supported Platforms: `NVIDIA CUDA`, `AMD ROCm`, `CPU`

## Additional Environment Variables

| Variable                 | Description |
| ------------------------ | ----------- |
| `AUTO_UPDATE`            | Update Web UI Forge on startup (default `false`) |
| `CIVITAI_TOKEN`          | Authenticate download requests from Civitai - Required for gated models |
| `HF_TOKEN`               | Authenticate download requests from HuggingFace - Required for gated models (SD3, FLUX, etc.) |
| `FORGE_ARGS`             | Startup arguments. eg. `--no-half --api` |
| `FORGE_PORT_HOST`        | Web UI port (default `7860`) |
| `FORGE_REF`              | Git reference for auto update. Accepts branch, tag or commit hash. Default: latest release |
| `FORGE_URL`              | Override `$DIRECT_ADDRESS:port` with URL for Web UI |

See the base environment variables [here](https://github.com/ai-dock/base-image/wiki/2.0-Environment-Variables) for more configuration options.

### Additional Python Environments

| Environment    | Packages |
| -------------- | ----------------------------------------- |
| `forge`        | SD WebUI Forge and dependencies |

This environment will be activated on shell login.

~~See the base micromamba environments [here](https://github.com/ai-dock/base-image/wiki/1.0-Included-Software#installed-micromamba-environments).~~


## Additional Services

The following services will be launched alongside the [default services](https://github.com/ai-dock/base-image/wiki/1.0-Included-Software) provided by the base image.

### Stable Diffusion WebUI Forge

The service will launch on port `7860` unless you have specified an override with `FORGE_PORT_HOST`.

You can set startup arguments by using variable `FORGE_ARGS`.

To manage this service you can use `supervisorctl [start|stop|restart] forge` or via the Service Portal application.

>[!NOTE]
>All services are password protected by default and HTTPS is available optionally. See the [security](https://github.com/ai-dock/base-image/wiki#security) and [environment variables](https://github.com/ai-dock/base-image/wiki/2.0-Environment-Variables) documentation for more information.


## Pre-Configured Templates

**Vast.​ai**

- [SD WebUI Forge:latest-cuda](https://link.ai-dock.org/template-vast-sd-webui)

---

_The author ([@robballantyne](https://github.com/robballantyne)) may be compensated if you sign up to services linked in this document. Testing multiple variants of GPU images in many different environments is both costly and time-consuming; This helps to offset costs_