#!/bin/false

build_cpu_main() {
    build_cpu_install_forge
    build_common_run_tests
}

build_cpu_install_forge() {
    build_common_install_forge
}

build_cpu_main "$@"