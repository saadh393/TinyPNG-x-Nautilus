#!/bin/bash

# Nautilus script to compress images using TinyPNG
# Dependencies: curl, file
# Written by Saad Hasan
# Last updated: 2021-08-15
# Inspired by the TinyPNG API documentation: https://tinypng.com/developers/reference and RanyAlbegWein's script:

# Note
# This script requires an API key from TinyPNG. You can get your API key by signing up at https://tinypng.com/developers
# Your API saves the API key in a file named .tinypng.apikey in your home directory.
# If You entered wrong API key, you can delete the .tinypng.apikey file and run the script again to enter the correct API key.
# If the Script showing CURL Error, you can check the error by removing the --silent flag from the curl command.

gnome-terminal -- bash -c '
# Function to display logo
display_logo() {
    cat << "EOF"

  _______   _____   _   _  __     __    _____    _   _    _____ 
 |__   __| |_   _| | \ | | \ \   / /   |  __ \  | \ | |  / ____|
    | |      | |   |  \| |  \ \_/ /    | |__) | |  \| | | |  __ 
    | |      | |   | . ` |   \   /     |  ___/  | . ` | | | |_ |
    | |     _| |_  | |\  |    | |      | |      | |\  | | |__| |
    |_|    |_____| |_| \_|    |_|      |_|      |_| \_|  \_____|
                                                                
                         - Written by Saad Hasan -                                     

EOF
}

# The API key.
apikey=
keyfile="$HOME/.tinypng.apikey"

# API key for TinyPNG
prompt_for_key() {
    printf "Get your API key from %s copy and paste it here.\n" "$dev_url"
    read -p "Enter your API key: " apikey
    echo
}

# Saves the API key for future requests.
# Args: API key.
save_apikey() {
    local key=$1
    umask 0077
    printf "%s\n" "$key" > "$keyfile"
}

# Reads the API key.
# Args: none.
read_key() {
    read -s -p apikey < "$keyfile"
} 2>/dev/null

# Args: File name.
is_png() {
    local file=$1
    [[ "$(file --brief --mime-type "$file")" = "image/png" ]]
}

# Check if a file is a JPEG image.
# Args: File name.
is_jpg() {
    local file=$1
    [[ "$(file --brief --mime-type "$file")" = "image/jpeg" ]]
}

# Function to compress and save an image using TinyPNG
compress_image() {
    local png="$1"
    local apiurl="https://api.tinify.com/shrink"
    local baseurl="api.tinify.com"
    
    # Compress the image using TinyPNG and capture the URL of the compressed image
    curl --silent --fail  --user api:$apikey \
        --data-binary @"$png" -i "$apiurl" --dump-header /dev/stdout | grep -oE -m1 "https://$baseurl/output/[[:alnum:]]+" &
    wait   
}

# Function to download a file from a URL
download() {
    local file="$1"
    local url="$2"

    # Download the file from the URL
    curl --fail --progress-bar --output "$file" "$url" &
    wait

}

# Function to extract the directory from a path
eliminate_filename() {
    local path="$1"
    local directory=$(dirname "$path")
    echo "$directory"
}

# ------------------------------ Execution ------------------------------

display_logo

# Check if the API key is set
if [[ ! $apikey ]]; then
    if ! read_key; then
        prompt_for_key
        save_apikey "$apikey"
    fi
fi
# Loop through each selected file path

while IFS= read -r line; do
    # Check if the line is a valid file path
    if [ ${#line} -ge 5 ]; then
        directory=$(eliminate_filename "$line")

        # Get the filename from the full path
        filename=$(basename "$line")

        # Construct the output path by combining the directory with the filename
        output_path="$directory/compressed_$filename"

        # Compress the image and get the URL of the compressed image
        image_url=$(compress_image "$line")

        echo "Downloading compressed image to: $output_path"

        # Download the compressed image to the output path
        download "$output_path" "$image_url"
       
    fi
done <<< "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS";  echo "\nPress a key to Exit"; read line; exit;'
