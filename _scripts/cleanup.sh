#!/bin/bash

# Base directories
SOURCE_DOCS="/home/azureuser/workspace/projects/horus/docs"
TARGET_DOCS="/home/azureuser/workspace/projects/horus/codebase/mega-docs/docs"

# Function to create directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory: $1"
    fi
}

# Move C4 model files
echo "Moving C4 model files..."
create_dir "$TARGET_DOCS/technical/architecture/c4-models"
cp -r "$SOURCE_DOCS/technical/architecture/c4-models/"* "$TARGET_DOCS/technical/architecture/c4-models/"

# Move template files
echo "Moving template files..."
create_dir "$TARGET_DOCS/technical/templates/api"
create_dir "$TARGET_DOCS/technical/templates/architecture"
create_dir "$TARGET_DOCS/technical/templates/deployment"
create_dir "$TARGET_DOCS/technical/templates/user-guide"

cp "$SOURCE_DOCS/templates/api/service-api.md" "$TARGET_DOCS/technical/templates/api/"
cp "$SOURCE_DOCS/templates/architecture/adr.md" "$TARGET_DOCS/technical/templates/architecture/"
cp "$SOURCE_DOCS/templates/deployment/service-deployment.md" "$TARGET_DOCS/technical/templates/deployment/"
cp "$SOURCE_DOCS/templates/user-guide/feature-guide.md" "$TARGET_DOCS/technical/templates/user-guide/"
cp "$SOURCE_DOCS/templates/technical.md" "$TARGET_DOCS/technical/templates/"

# Clean up duplicate directories in target
cd "$TARGET_DOCS" || exit 1

# Remove duplicate troubleshooting directory
if [ -d "user/troubleshooting" ] && [ -d "user/guides/troubleshooting" ]; then
    # Move any unique content
    cp -n user/troubleshooting/* user/guides/troubleshooting/ 2>/dev/null || true
    rm -rf user/troubleshooting
fi

# Remove duplicate templates directory if it exists at root level
if [ -d "templates" ] && [ -d "technical/templates" ]; then
    # Move any unique content
    cp -n templates/* technical/templates/ 2>/dev/null || true
    rm -rf templates
fi

# Clean up empty directories
find . -type d -empty -delete

echo "Cleanup completed!" 