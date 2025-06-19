# fail the whole script if any command bellow fails
set -e

on_error() {
    echo '----------------------------------------------------'
    MESSAGE='Build script has failed!'
    echo "$MESSAGE"
    echo '----------------------------------------------------'
}

trap "on_error" ERR

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') --- $1"
}
log "Executing Linux build script..."

script_path=$(realpath "$0")
log "Script path: $script_path"

rm -rf node_modules

npm ci

# check package.json for more details
log "Transpiling the ABAP code..."
npm run transpile

# disable abaplint
# npm run lint

# Prerequisite for esbuild
# Find all .mjs files in the current directory and its subdirectories,
# and replaces all occurrences of %23 with # in those files.
find . -name '*.mjs' -print | xargs sed -i 's/%23/#/g'

log "Packaging the code..."

FILE_NAME='abap-transformation-executor.mjs'
OUTPUT_FILE='dist/abap-transformation-executor.mjs'

npx esbuild src/$FILE_NAME \
    --tsconfig=./tsconfig.json \
    --bundle \
    --outfile=$OUTPUT_FILE \
    --format=esm \
    --keep-names \
    --target=es2022 \
    --external:tls \
    --external:net \
    --external:util \
    --external:crypto \
    --external:zlib \
    --external:http \
    --external:https \
    --external:fs \
    --external:path \
    --external:url \
    --external:sdk \
    --external:snowflake-sdk \
    --external:dotenv \
    --inject:./polyfills/buffer.js --inject:./polyfills/process.js \
    --out-extension:.js=.mjs

log "Packaging completed..."

log "Build script completed! Script path $script_path"

# to speed up the publish process since copy is slow
rm -rf node_modules