#!/bin/bash

# Organization name
ORG="horus-tatweer"

# Target directory
TARGET_DIR="/home/azureuser/workspace/projects/horus/codebase"

# Array of repository names
declare -a REPOS=(
    "mega-solution-platform"
    "mega-service-auth"
    "mega-service-communications"
    "mega-service-projects"
    "mega-service-hr"
    "mega-service-finance"
    "mega-infrastructure"
    "mega-docs"
    "mega-devops"
)

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Function to clone repository
clone_repo() {
    local repo=$1
    echo "Cloning repository: $repo"
    
    if [ -d "$repo" ]; then
        echo "Directory $repo already exists, pulling latest changes..."
        cd "$repo"
        git pull
        cd ..
    else
        gh repo clone "$ORG/$repo"
    fi
}

# Clone all repositories
for repo in "${REPOS[@]}"
do
    clone_repo "$repo"
done

echo "All repositories have been cloned to $TARGET_DIR"
ls -l

# Create a status summary
echo -e "\nRepository Status:"
for repo in "${REPOS[@]}"
do
    if [ -d "$repo" ]; then
        echo -e "\n=== $repo ==="
        cd "$repo"
        echo "Branch: $(git branch --show-current)"
        echo "Last commit: $(git log -1 --pretty=format:'%h - %s (%cr)' --abbrev-commit)"
        cd ..
    else
        echo -e "\n=== $repo === [NOT CLONED]"
    fi
done 