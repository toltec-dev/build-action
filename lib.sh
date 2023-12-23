prepend() { xargs -rn1 echo "$1" }
toArray() { jq --raw-input | jq --compact-output --slurp '.' }
toFlagsArray() { echo "$2" | prepend "--${1}" | toArray }
setOutputVar() { echo "${1}='$2'" | tee -a "$GITHUB_OUTPUT" }
