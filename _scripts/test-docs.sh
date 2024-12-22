#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Function to print status
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓ $2${NC}"
    else
        echo -e "${RED}✗ $2${NC}"
        exit 1
    fi
}

# Function to check markdown links
check_links() {
    echo -e "${YELLOW}Checking markdown links...${NC}"
    find docs -name "*.md" -exec markdown-link-check {} \;
    print_status $? "Link check completed"
}

# Function to validate markdown formatting
check_markdown() {
    echo -e "${YELLOW}Validating markdown formatting...${NC}"
    markdownlint docs/**/*.md
    print_status $? "Markdown validation completed"
}

# Function to test code examples
test_code_examples() {
    echo -e "${YELLOW}Testing code examples...${NC}"
    find docs -name "*.md" -exec markdown-code-runner {} \;
    print_status $? "Code examples test completed"
}

# Function to validate diagrams
check_diagrams() {
    echo -e "${YELLOW}Validating diagrams...${NC}"
    
    # Check PlantUML diagrams
    echo "Checking PlantUML diagrams..."
    find docs -name "*.md" -exec grep -l "```plantuml" {} \; | while read file; do
        plantuml -tpng "$file"
    done
    
    # Check C4 diagrams
    echo "Checking C4 diagrams..."
    find docs -name "*.md" -exec grep -l "```c4plantuml" {} \; | while read file; do
        plantuml -tpng "$file"
    done
    
    print_status $? "Diagram validation completed"
}

# Function to check spelling
check_spelling() {
    echo -e "${YELLOW}Checking spelling...${NC}"
    find docs -name "*.md" -exec spellchecker {} \;
    print_status $? "Spell check completed"
}

# Function to validate frontmatter
check_frontmatter() {
    echo -e "${YELLOW}Validating frontmatter...${NC}"
    find docs -name "*.md" -exec yaml-lint {} \;
    print_status $? "Frontmatter validation completed"
}

# Function to check image references
check_images() {
    echo -e "${YELLOW}Checking image references...${NC}"
    find docs -name "*.md" -exec grep -l "!\[.*\](" {} \; | while read file; do
        grep -o "!\[.*\]([^)]*)" "$file" | while read img; do
            path=$(echo "$img" | sed 's/.*(\(.*\))/\1/')
            if [[ "$path" =~ ^http ]]; then
                curl --output /dev/null --silent --head --fail "$path"
            else
                [ -f "$(dirname "$file")/$path" ]
            fi
        done
    done
    print_status $? "Image reference check completed"
}

# Function to validate internal links
check_internal_links() {
    echo -e "${YELLOW}Checking internal links...${NC}"
    find docs -name "*.md" -exec grep -l "\[.*\](" {} \; | while read file; do
        grep -o "\[.*\]([^)]*)" "$file" | while read link; do
            path=$(echo "$link" | sed 's/.*(\(.*\))/\1/')
            if [[ ! "$path" =~ ^http ]]; then
                [ -f "$(dirname "$file")/$path" ]
            fi
        done
    done
    print_status $? "Internal link check completed"
}

# Function to check documentation structure
check_structure() {
    echo -e "${YELLOW}Checking documentation structure...${NC}"
    required_files=(
        "README.md"
        "SUMMARY.md"
        "docs/README.md"
    )
    for file in "${required_files[@]}"; do
        [ -f "$file" ]
    done
    print_status $? "Structure check completed"
}

# Function to validate code blocks
check_code_blocks() {
    echo -e "${YELLOW}Validating code blocks...${NC}"
    find docs -name "*.md" -exec grep -l "```" {} \; | while read file; do
        awk '/```/{p=NR+1}(NR==p){print}' "$file" | while read lang; do
            [[ "$lang" =~ ^[a-zA-Z0-9]+$ ]]
        done
    done
    print_status $? "Code block validation completed"
}

# Run all tests
run_all_tests() {
    check_structure
    check_links
    check_markdown
    test_code_examples
    check_diagrams
    check_spelling
    check_frontmatter
    check_images
    check_internal_links
    check_code_blocks
}

# Main execution
echo -e "${YELLOW}Starting documentation tests...${NC}"
run_all_tests
echo -e "${GREEN}All tests completed successfully!${NC}"
