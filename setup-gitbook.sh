#!/bin/bash

cd /home/azureuser/workspace/projects/horus/codebase/mega-docs

# Create main documentation categories
mkdir -p docs/{technical,business,marketing,user,legal,training}

# Technical Documentation Structure
mkdir -p docs/technical/{
    architecture,
    development,
    deployment,
    security,
    api,
    infrastructure,
    monitoring,
    performance,
    troubleshooting,
    integrations
}

# Business Documentation Structure
mkdir -p docs/business/{
    processes,
    workflows,
    compliance,
    policies,
    analytics,
    reports,
    roadmap,
    case-studies,
    roi-analysis,
    slas
}

# Marketing Documentation Structure
mkdir -p docs/marketing/{
    product,
    features,
    solutions,
    comparisons,
    showcases,
    success-stories,
    presentations,
    branding,
    resources,
    campaigns
}

# User Documentation Structure
mkdir -p docs/user/{
    guides,
    tutorials,
    faq,
    troubleshooting,
    videos,
    interactive-demos
}

# Legal Documentation Structure
mkdir -p docs/legal/{
    terms,
    privacy,
    compliance,
    licenses,
    agreements
}

# Training Documentation Structure
mkdir -p docs/training/{
    onboarding,
    courses,
    workshops,
    certifications,
    assessments
}

# Update book.json with enhanced configuration
cat << 'EOF' > book.json
{
  "title": "Mega Solution Platform Documentation",
  "description": "Comprehensive documentation for the Mega Solution Platform",
  "plugins": [
    "theme-default",
    "search",
    "collapsible-menu",
    "code",
    "copy-code-button",
    "mermaid-gb3",
    "plantuml",
    "mathjax",
    "viz",
    "chart",
    "accordion",
    "advanced-emoji",
    "video",
    "3d",
    "sequence-diagrams",
    "flow",
    "graphviz",
    "tabs",
    "alerts",
    "image-captions",
    "include-codeblock",
    "anchors",
    "page-toc-button",
    "swagger",
    "katex",
    "hints",
    "theme-horus",
    "lightbox",
    "presentation",
    "asciinema",
    "codetabs",
    "versions-select",
    "edit-link",
    "github",
    "sharing",
    "sitemap",
    "analytics"
  ],
  "pluginsConfig": {
    "theme-default": {
      "showLevel": true
    },
    "edit-link": {
      "base": "https://github.com/horus-tatweer/mega-docs/edit/main",
      "label": "Edit This Page"
    },
    "github": {
      "url": "https://github.com/horus-tatweer/mega-docs"
    },
    "theme-horus": {
      "logo": "assets/logo.png",
      "favicon": "assets/favicon.ico"
    },
    "analytics": {
      "google": "UA-XXXXXXXX-X"
    }
  },
  "variables": {
    "versions": {
      "current": "1.0.0"
    }
  },
  "styles": {
    "website": "styles/website.css",
    "pdf": "styles/pdf.css",
    "epub": "styles/epub.css",
    "mobi": "styles/mobi.css"
  }
}
EOF

# Create custom styles directory
mkdir -p styles
cat << 'EOF' > styles/website.css
/* Custom styles for enhanced documentation */
.markdown-section {
    font-size: 16px;
    line-height: 1.6;
}

.page-inner {
    max-width: 1200px;
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
    .book {
        background: #1a1a1a;
        color: #f0f0f0;
    }
}

/* Responsive design */
@media screen and (max-width: 768px) {
    .page-inner {
        padding: 20px;
    }
}
EOF

# Create enhanced SUMMARY.md
cat << 'EOF' > SUMMARY.md
# Summary

* [Introduction](README.md)

## Technical Documentation
* [Architecture](docs/technical/architecture/README.md)
* [Development](docs/technical/development/README.md)
* [API Reference](docs/technical/api/README.md)
* [Security](docs/technical/security/README.md)
* [Infrastructure](docs/technical/infrastructure/README.md)

## Business Documentation
* [Processes](docs/business/processes/README.md)
* [Workflows](docs/business/workflows/README.md)
* [Analytics](docs/business/analytics/README.md)
* [ROI Analysis](docs/business/roi-analysis/README.md)
* [SLAs](docs/business/slas/README.md)

## Marketing Documentation
* [Product Overview](docs/marketing/product/README.md)
* [Features](docs/marketing/features/README.md)
* [Success Stories](docs/marketing/success-stories/README.md)
* [Resources](docs/marketing/resources/README.md)
* [Branding](docs/marketing/branding/README.md)

## User Documentation
* [Getting Started](docs/user/guides/getting-started.md)
* [Tutorials](docs/user/tutorials/README.md)
* [FAQ](docs/user/faq/README.md)
* [Interactive Demos](docs/user/interactive-demos/README.md)

## Legal Documentation
* [Terms of Service](docs/legal/terms/README.md)
* [Privacy Policy](docs/legal/privacy/README.md)
* [Compliance](docs/legal/compliance/README.md)

## Training
* [Onboarding](docs/training/onboarding/README.md)
* [Courses](docs/training/courses/README.md)
* [Certifications](docs/training/certifications/README.md)
EOF

# Update Dockerfile to include additional dependencies
cat << 'EOF' > Dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    calibre \
    fonts-liberation \
    git \
    curl \
    graphviz \
    plantuml \
    python3 \
    python3-pip \
    ffmpeg \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

# Install GitBook CLI and plugins
RUN npm install -g gitbook-cli \
    && gitbook fetch 3.2.3 \
    && npm install -g mermaid.cli \
    && npm install -g asciinema-player

WORKDIR /docs

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Install Python dependencies for additional features
RUN pip3 install mkdocs-material \
    mkdocs-diagrams \
    cairosvg

# Expose ports
EXPOSE 4000 35729

# Command to serve GitBook
CMD ["gitbook", "serve"]
EOF

# Create example files demonstrating various features
mkdir -p docs/examples
cat << 'EOF' > docs/examples/diagrams.md
# Diagram Examples

## Mermaid Diagram
```mermaid
graph TD
    A[Client] --> B[Load Balancer]
    B --> C[Server1]
    B --> D[Server2]
```

## PlantUML Diagram
```plantuml
@startuml
actor User
User -> System: Login
System --> User: Token
@enduml
```

## Sequence Diagram
```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
```

## Math Equations
$$
E = mc^2
$$

## 3D Model
```stl
// Include STL model
```

## Emoji Examples
:rocket: Launch
:gear: Settings
:chart_with_upwards_trend: Analytics

## Video Example
{% video %}https://example.com/video.mp4{% endvideo %}

## Interactive Terminal
{% asciinema %}path-to-recording.json{% endasciinema %}
EOF

# Create docker-compose.yml with enhanced configuration
cat << 'EOF' > docker-compose.yml
version: '3.8'

services:
  docs:
    build: .
    ports:
      - "4000:4000"
      - "35729:35729"
    volumes:
      - .:/docs
      - node_modules:/docs/node_modules
    environment:
      - NODE_ENV=development
      - PLANTUML_SERVER=http://plantuml:8080
    command: >
      /bin/bash -c "
        gitbook install &&
        gitbook serve
      "
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:4000"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s

  plantuml:
    image: plantuml/plantuml-server:latest
    ports:
      - "8080:8080"

volumes:
  node_modules:
EOF

echo "Enhanced GitBook setup completed!" 