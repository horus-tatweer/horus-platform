#!/bin/bash

# Move to the docs directory
cd docs || exit 1

# Create temporary directory for reorganization
mkdir -p _temp

# Move top-level directories to temp
mv technical _temp/ 2>/dev/null || true
mv business _temp/ 2>/dev/null || true
mv marketing _temp/ 2>/dev/null || true
mv user _temp/ 2>/dev/null || true
mv legal _temp/ 2>/dev/null || true
mv training _temp/ 2>/dev/null || true

# Move and merge directories
mv architecture/* _temp/technical/architecture/ 2>/dev/null || true
mv deployment/* _temp/technical/deployment/ 2>/dev/null || true
mv operations/* _temp/technical/operations/ 2>/dev/null || true
mv api/* _temp/technical/api/ 2>/dev/null || true
mv development/* _temp/technical/development/ 2>/dev/null || true
mv user-guides/* _temp/user/guides/ 2>/dev/null || true
mv project-management/* _temp/business/projects/ 2>/dev/null || true

# Move templates to technical
mv templates _temp/technical/

# Move examples to technical
mv examples _temp/technical/

# Clean up empty directories
rm -rf architecture deployment operations api development user-guides project-management

# Move everything back from temp
mv _temp/* ./ 2>/dev/null || true
rm -rf _temp

echo "Directory reorganization completed!" 