#!/bin/bash

# Exit on error
set -e

# Define variables
DOCS_REPO_URL="https://github.com/dynamsoft-docs/web-twain-docs/archive/refs/heads/preview.zip"
TEMPLATE_REPO_URL="https://github.com/dynamsoft-docs/Docs-Template-Repo/archive/refs/heads/preview.zip"
TEMP_DIR="temp_docs"
TEMPLATE_DIR="Docs-Template-Repo-preview"
FINAL_DIR="web-twain-docs-preview"

echo "=== Starting build script ==="

# Clean up any existing temporary directories
echo "Cleaning up old directories..."
rm -rf "$TEMP_DIR" "$FINAL_DIR" "$TEMPLATE_DIR"

# Create temporary directory
echo "Creating temporary directory: $TEMP_DIR"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

# Download first repository (web-twain-docs)
echo "Downloading web-twain-docs repository..."
curl -L -o docs.zip "$DOCS_REPO_URL"

# Extract first repository
echo "Extracting web-twain-docs..."
unzip -q docs.zip

# Get the extracted directory name (dynamic detection)
DOCS_EXTRACTED_DIR=$(find . -maxdepth 1 -type d -name "web-twain-docs-*" | head -1 | sed 's|^\./||')
echo "Detected docs directory: $DOCS_EXTRACTED_DIR"

if [ -z "$DOCS_EXTRACTED_DIR" ]; then
    echo "Error: Unable to find extracted docs directory"
    exit 1
fi

# Create final directory and copy docs content into it
echo "Creating final directory and copying docs content..."
mkdir -p "../$FINAL_DIR"
cp -rf "$DOCS_EXTRACTED_DIR"/* "../$FINAL_DIR"/ 2>/dev/null || true

# Go back to parent directory
cd ..

# Download second repository (Docs-Template-Repo)
echo "Downloading Docs-Template-Repo repository..."
curl -L -o template.zip "$TEMPLATE_REPO_URL"

# Extract second repository
echo "Extracting Docs-Template-Repo..."
unzip -q template.zip

# Get the template extracted directory name
TEMPLATE_EXTRACTED_DIR=$(find . -maxdepth 1 -type d -name "Docs-Template-Repo-*" | head -1 | sed 's|^\./||')
echo "Detected template directory: $TEMPLATE_EXTRACTED_DIR"

if [ -z "$TEMPLATE_EXTRACTED_DIR" ]; then
    echo "Error: Unable to find extracted template directory"
    exit 1
fi

# Rename template directory to standard name
if [ "$TEMPLATE_EXTRACTED_DIR" != "$TEMPLATE_DIR" ]; then
    echo "Renaming $TEMPLATE_EXTRACTED_DIR to $TEMPLATE_DIR"
    mv "$TEMPLATE_EXTRACTED_DIR" "$TEMPLATE_DIR"
fi

# Ensure final directory exists
if [ ! -d "$FINAL_DIR" ]; then
    echo "Error: Final directory $FINAL_DIR does not exist"
    exit 1
fi

# Overwrite operation: Copy template repository contents to final directory (overwrite)
echo "Performing overwrite operation..."
cp -rf "$TEMPLATE_DIR"/* "$FINAL_DIR"/ 2>/dev/null || echo "Warning: Some files may not have been copied during the process, but execution can continue"

# Enter final directory
cd "$FINAL_DIR"

# Display current directory
echo "Current working directory: $(pwd)"
echo "Final directory contents:"
ls -la

# Replace strings in all files under _includes directory
echo "Replacing assetsPath in _includes directory..."
if [ -d "_includes" ]; then
    find _includes -type f -exec sed -i.bak "s|assetsPath = '/webres/wwwroot'|assetsPath = 'https://www.dynamsoft.com/webres/wwwroot'|g" {} \;
    find _includes -name "*.bak" -type f -delete
    echo "_includes directory processing completed"
else
    echo "Warning: _includes directory does not exist"
fi

# Replace strings in all files under _layouts directory
echo "Replacing assetsPath in _layouts directory..."
if [ -d "_layouts" ]; then
    find _layouts -type f -exec sed -i.bak "s|assetsPath = '/webres/wwwroot'|assetsPath = 'https://www.dynamsoft.com/webres/wwwroot'|g" {} \;
    find _layouts -name "*.bak" -type f -delete
    echo "_layouts directory processing completed"
else
    echo "Warning: _layouts directory does not exist"
fi

# Go back to parent directory
cd ..

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -f template.zip
rm -rf "$TEMP_DIR" "$TEMPLATE_DIR"

echo "=== Build completed ==="
echo "Final directory: $FINAL_DIR"
echo "Final directory contents:"
ls -la "$FINAL_DIR"
