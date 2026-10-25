#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"   # always run from the project root
 
APP=MyDebugger
 
case "${1:-debug}" in
    debug)
        cmake -S . -B build/debug -DCMAKE_BUILD_TYPE=Debug
        cmake --build build/debug
        ;;
    prod)
        cmake -S . -B build/release -DCMAKE_BUILD_TYPE=Release
        cmake --build build/release
        ;;
    run-debug)
        bash "$0" debug
        ./build/debug/$APP
        ;;
    run-prod)
        bash "$0" prod
        ./build/release/$APP
        ;;
    clean)
        rm -rf build/debug build/release build/last.log
        ;;
    *)
        echo "usage: $0 {debug|prod|run-debug|run-prod|clean|pkill}"
        exit 1
        ;;
esac
