#!/bin/bash

cd /home/azureuser/workspace/projects/horus/codebase/mega-docs/docs || exit 1

# Create main sections
mkdir -p business/{processes,workflows,compliance,policies,analytics,reports,roadmap,case-studies,roi-analysis,slas,projects}
mkdir -p marketing/{product,features,solutions,comparisons,showcases,success-stories,presentations,branding,resources,campaigns}
mkdir -p user/{guides,tutorials,faq,troubleshooting,videos,interactive-demos}
mkdir -p legal/{terms,privacy,compliance,licenses,agreements}
mkdir -p training/{onboarding,courses,workshops,certifications,assessments}
mkdir -p technical/{api/{auth,communications,projects,hr,finance},operations/{monitoring,logging,backup,security,maintenance}}

# Create README files for main sections
echo "# Business Documentation" > business/README.md
echo "# Marketing Documentation" > marketing/README.md
echo "# User Documentation" > user/README.md
echo "# Legal Documentation" > legal/README.md
echo "# Training Documentation" > training/README.md
echo "# Technical Documentation" > technical/README.md

echo "Directory structure restored!" 