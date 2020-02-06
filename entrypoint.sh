output=$(mdl $INPUT_PATH)
echo ::set-output name=output::"$output"
if [ ! -z "$output" ]
then
    echo "FOUND MARKDOWN ISSUS"
    exit 255
fi
