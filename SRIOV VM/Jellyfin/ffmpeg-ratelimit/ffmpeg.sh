#!/bin/bash
readrate=2
null_input=1
null_output=0
parse_args() {
        while [ $# -gt 0 ]; do
                case "$1" in
                        -f)
                                if [ "$2" = "null" ]; then
                                        null_output=1
                                        shift
                                fi
                                ;;
                        -i)
                                null_input=0
                                ;;
                        *)
                                ;;
                esac
                shift
        done
}
parse_args "$@"
if [ $null_input -eq 1 ] || [ $null_output -eq 1 ]; then
        exec /usr/lib/jellyfin-ffmpeg/ffmpeg "$@"
else
        exec /usr/lib/jellyfin-ffmpeg/ffmpeg -readrate $readrate "$@"
fi