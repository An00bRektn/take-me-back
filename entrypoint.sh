#!/usr/bin/env bash
# Credit: https://github.com/trufflesecurity/trufflehog/blob/main/entrypoint.sh

# Parse the last argument into an array of extra_args.
mapfile -t extra_args < <(bash -c "for arg in ${*: -1}; do echo \$arg; done")
echo $(which gcc) "${@: 1: $#-1}" "${extra_args[@]}"
$(which gcc) "${@: 1: $#-1}" "${extra_args[@]}"

# this is a cringe way of doing it but whatever
if [[ ! -f "./libc.so.6" ]]; then
    cp $(gcc --print-file-name=libc.so.6) .
    cp $(ldd $(which true) | tail -n 1 | cut -d ' ' -f 1) .
fi