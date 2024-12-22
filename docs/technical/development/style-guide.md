# Documentation Style Guide

## General Principles
- Clear and concise writing
- Consistent terminology
- Active voice
- Present tense
- Task-oriented approach

## Document Structure
1. Title (H1)
2. Overview/Introduction
3. Prerequisites (if applicable)
4. Main Content
5. Related Information
6. Next Steps

## Formatting Guidelines

### Headers
- Use Title Case for H1 and H2
- Use Sentence case for H3 and below
- Maximum of 4 heading levels

### Code Blocks
```markdown
# Use language-specific code blocks
```python
def example():
    return "Hello World"
```
```

### Diagrams
1. **C4 Model Diagrams**
   - Context diagrams (L1)
   - Container diagrams (L2)
   - Component diagrams (L3)
   - Code diagrams (L4)

2. **Example C4 Context Diagram**
```c4plantuml
@startuml
!include C4_Context.puml

Person(customer, "Customer", "A user of our system")
System(system, "Our System", "Handles customer requests")
System_Ext(external, "External System", "Provides data")

Rel(customer, system, "Uses")
Rel(system, external, "Gets data from")
@enduml
```

### Links and References
- Use descriptive link text
- Avoid "click here" or "this link"
- Include hover text for complex terms

### Images
- Include alt text
- Use descriptive filenames
- Optimize for web
- Maximum width: 800px

### Tables
| Use | Tables | Sparingly |
|-----|---------|-----------|
| For | Structured | Data |

### Callouts
> Important information should use blockquotes or alerts

!!! note
    Use admonitions for important notes

!!! warning
    Use warnings for critical information

## Technical Writing Guidelines

### API Documentation
```yaml
/endpoint:
  get:
    summary: Brief description
    description: Detailed description
```

### Command Line Examples
```bash
$ command --flag value  # Include comments
```

### Variables and Placeholders
Use angle brackets for placeholders: `<username>`

## Terminology
- Maintain a consistent glossary
- Define acronyms on first use
- Use approved product names

## Version Control
- One sentence per line for better diff
- Use conventional commits
- Include change reason in commits
