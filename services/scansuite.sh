#! /bin/bash

if ! ls *.lic &> /dev/null; then
    echo "No licence files found in the current folder. Copy the file and try again."
    exit 1
fi

for file in *.lic; do
    license=$(echo "$file" | sed 's/.*_\(.*\)\..*/\1/')
    if [[ ${#license} -eq 6 ]]; then
        lic_path=$(realpath "$file")
        mkdir ~/apps
        cd apps
        git clone https://github.com/myappsec/scansuite
        cd scansuite && cp $lic_path key/
        ./install $license
        if [ $? -ne 0 ]; then
            exit 1
        else
            rm $lic_path
            cd app/scansuite && ./start-scansuite
            exit 0
        fi

    else
        echo "Invalid licence file name. Please check the file name and try again."
        exit 1
    fi
done
