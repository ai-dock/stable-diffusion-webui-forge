#!/bin/false
# This file will be sourced in init.sh

function preflight_main() {
    preflight_update_forge
    printf "%s" "${FORGE_ARGS}" > /etc/forge_args.conf
}

function preflight_update_forge() {
    if [[ ${AUTO_UPDATE,,} == "true" ]]; then
        /opt/ai-dock/bin/update-forge.sh
    else
        printf "Skipping auto update (AUTO_UPDATE != true)"
    fi
}

preflight_main "$@"