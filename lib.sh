prepend() {
  xargs -rn1 echo "$1"
}
toArray() {
  jq --raw-input | jq --compact-output --slurp '.'
}
toFlagsArray() {
  echo "$2" | prepend "--${1}" | toArray
}
setOutputVar() {
  echo "${1}=$2" | tee -a "$GITHUB_OUTPUT" &> /dev/null
}
exists() {
  if ! [ -f "$1" ]; then
    echo "Missing ${1}"
    return 1
  fi
}
missing() {
  if [ -f "$1" ]; then
    echo "Found ${1}"
    return 1
  fi
}
