#! /bin/bash

if ! ls *.lic &> /dev/null; then
    echo "No license files found in the current folder. Copy the file and try again."
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
            echo ""
            cd ~/apps/scansuite && ./start-scansuite
            
            if [ $? -ne 0 ]; then
                echo ""
                echo "ScanSuite start failed. Fixing possible issues."
                ~/apps/scansuite/services/reset-scansuite
                cd ~/apps/scansuite && ./start-scansuite
            fi

            if [ $? -ne 0 ]; then
                echo ""
                echo "ScanSuite start failed."
                echo "Try running cd ~/apps/scansuite && ./start-scansuite"
                exit 1
            fi

            echo "ScanSuite started"
            echo ""
            echo "To start or restart it manually run:"
            echo "cd ~/apps/scansuite && ./start-scansuite"
            echo ""
            echo "Get DefectDojo admin password and API key by running:"
            echo "cd ~/apps/scansuite/defectdojo && ./dojo-password"
            echo ""
            echo "To fetch updates run:"
            echo "cd ~/apps/scansuite && ./install <your_key_id>"
            echo ""
            exit 0
        fi

    else
        echo "Invalid license file name. Please check the file name and try again."
        exit 1
    fi
done
