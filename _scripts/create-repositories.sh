#!/bin/bash

# Organization name
ORG="horus-tatweer"

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

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Function to create repository and initial README
create_repo() {
    local repo=$1
    echo "Creating repository: $repo"
    
    # Create repository using GitHub CLI
    gh repo create "$ORG/$repo" --private --description "Part of Mega Solution Platform" --confirm

    # Clone the repository
    gh repo clone "$ORG/$repo"
    
    # Create and push README
    cd "$repo"
    echo "# $repo" > README.md
    echo "" >> README.md
    echo "Part of Mega Solution Platform" >> README.md
    
    git add README.md
    git commit -m "chore: initial commit"
    git push origin main
    
    cd ..
}

# First, create mega-devops since we'll need it for the script
create_repo "mega-devops"

# Create scripts directory and add this script
cd mega-devops
mkdir -p scripts
cp "$0" scripts/create-repositories.sh
chmod +x scripts/create-repositories.sh
git add scripts/create-repositories.sh
git commit -m "feat: add repository creation script"
git push origin main
cd ..

# Create other repositories
for repo in "${REPOS[@]}"
do
    # Skip mega-devops as it's already created
    if [ "$repo" != "mega-devops" ]; then
        create_repo "$repo"
    fi
done

# Cleanup
cd
rm -rf "$TEMP_DIR"

echo "All repositories have been created successfully!"