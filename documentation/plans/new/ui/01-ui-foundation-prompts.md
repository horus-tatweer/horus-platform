# UI Platform Development Prompts

## 1. Atomic Design System Setup

```prompt
Create an atomic design system following these hierarchical levels:

1. Atoms:
   - Typography elements (headings, paragraphs, spans)
   - Basic inputs (text, checkbox, radio)
   - Buttons
   - Icons
   - Colors
   - Spacing units

2. Molecules:
   - Form fields with labels
   - Search bars
   - Card headers
   - Navigation items
   - Notification items

3. Organisms:
   - Forms
   - Headers
   - Footers
   - Navigation bars
   - Sidebars
   - Feature sections

4. Templates:
   - Page layouts
   - Grid systems
   - Content structures

5. Pages:
   - Specific page implementations
   - Page variations

Include documentation for composition patterns and component relationships.
```

## 2. Multi-Theme System

```prompt
Develop a comprehensive multi-theme system with:

1. Theme Structure:
   - Base theme definition
   - Theme inheritance
   - Theme overrides
   - Dynamic theme switching
   - Theme persistence

2. Theme Components:
   - Color palettes
   - Typography scales
   - Spacing systems
   - Border styles
   - Shadow systems
   - Animation variables

3. Business Domain Themes:
   - Corporate/Enterprise
   - E-commerce
   - Educational
   - Healthcare
   - Financial
   - Social/Community

4. Theme Management:
   - Theme switcher component
   - Theme preview
   - Theme customization interface
   - Theme export/import

Include implementation using CSS variables and theme context.
```

## 3. Common Business Domain Blocks

```prompt
Create reusable business domain blocks for:

1. Authentication & Authorization:
   - Login forms
   - Registration flows
   - Password recovery
   - Multi-factor authentication
   - Social authentication

2. User Management:
   - Profile management
   - Settings panels
   - Preference controls
   - Account management

3. Communication:
   - Contact forms
   - Chat interfaces
   - Notification systems
   - Message centers

4. Commerce:
   - Product cards
   - Shopping carts
   - Checkout flows
   - Order tracking

5. Content:
   - Blog layouts
   - Article templates
   - Media galleries
   - Content filters

Include customization options for different business contexts.
```

## 4. Design System Setup

```prompt
Create a modern design system for a large-scale enterprise platform with the following requirements:

- Color system with primary, secondary, and semantic colors
- Typography system with responsive scaling
- Spacing and layout system
- Component-specific tokens
- Dark/light theme support
- Accessibility compliance
- CSS-in-JS setup using styled-components/emotion

Include the base configuration files and example usage.
```

## 5. Core Component Library

```prompt
Design and implement a core component library with the following base components:

1. Layout Components:
   - Container
   - Grid
   - Stack
   - Box
   - Flex

2. Input Components:
   - Button (variants: primary, secondary, ghost)
   - TextField
   - Select
   - Checkbox
   - Radio
   - Switch
   - DatePicker

3. Display Components:
   - Card
   - Table
   - List
   - Badge
   - Avatar
   - Icons
   - Modal
   - Toast

Include TypeScript types, Storybook stories, and unit tests for each component.
```

## 6. Form System

```prompt
Create a comprehensive form system with the following features:

- Form builder with validation
- Field composition
- Error handling
- Form state management
- Auto-save functionality
- Field dependencies
- Conditional rendering
- Multi-step forms
- Form templates

Include integration with popular form libraries (Formik/React Hook Form).
```

## 7. Data Visualization Components

```prompt
Develop reusable data visualization components:

1. Charts:
   - Line Chart
   - Bar Chart
   - Pie Chart
   - Area Chart
   - Scatter Plot

2. Features:
   - Responsive design
   - Interactive tooltips
   - Animation
   - Custom theming
   - Data loading states
   - Error states

Use D3.js/Chart.js and include performance optimization strategies.
```

## 8. Layout Templates

```prompt
Design responsive layout templates for common enterprise scenarios:

1. Dashboard layouts
2. List/Detail views
3. Settings pages
4. Analytics pages
5. Form pages
6. Authentication pages
7. Error pages

Include navigation patterns and responsive breakpoints.
```

## 9. Animation System

```prompt
Create an animation system with:

1. Transition patterns:
   - Page transitions
   - Component mounting/unmounting
   - State changes
   - Loading states

2. Features:
   - Performance optimization
   - Accessibility considerations
   - Reduced motion support
   - Animation composition

Use Framer Motion/React Spring for implementation.
```

## 10. Accessibility Implementation

```prompt
Implement accessibility features across the UI platform:

1. Core requirements:
   - ARIA labels
   - Keyboard navigation
   - Focus management
   - Screen reader support
   - Color contrast
   - Reduced motion

2. Testing:
   - Automated a11y testing
   - Screen reader testing
   - Keyboard navigation testing

Include documentation for accessibility best practices.
```

## 11. Performance Optimization

```prompt
Implement performance optimizations:

1. Code splitting strategies
2. Component lazy loading
3. Image optimization
4. Bundle size optimization
5. Virtual scrolling for large lists
6. Memoization patterns
7. Resource preloading
8. CSS optimization

Include monitoring and measurement tools setup.
```

## 12. Documentation System

```prompt
Create a comprehensive documentation system:

1. Component API documentation
2. Usage examples
3. Best practices
4. Design guidelines
5. Accessibility guidelines
6. Performance guidelines
7. Contributing guidelines
8. Changelog management

Set up documentation site using Docusaurus/Storybook.
```

## 13. Testing Framework

```prompt
Establish a testing framework for UI components:

1. Unit testing setup
2. Integration testing
3. Visual regression testing
4. Performance testing
5. Accessibility testing
6. Cross-browser testing
7. Mobile testing
8. Test documentation

Include CI/CD pipeline configuration.
```

## 14. Common Pages Library

```prompt
Develop a comprehensive library of common pages needed across business domains:

1. Authentication Pages:
   - Login
   - Registration
   - Password Reset
   - Multi-factor Authentication
   - Social Login

2. User Account Pages:
   - Profile View/Edit
   - Settings
   - Preferences
   - Security Settings
   - Billing/Subscription

3. Content Pages:
   - Home/Landing
   - About
   - Contact
   - FAQ
   - Terms & Privacy
   - Blog/News
   - Documentation

4. Error Pages:
   - 404 Not Found
   - 403 Forbidden
   - 500 Server Error
   - Maintenance
   - Offline

5. Utility Pages:
   - Search Results
   - Site Map
   - Help Center
   - Status Page
   - Feedback Forms

6. Dashboard Pages:
   - Analytics Overview
   - User Dashboard
   - Admin Dashboard
   - Reports View
   - Activity Logs

Include responsive layouts, loading states, and error handling for each page type.
```

## 15. Component Architecture Guidelines

```prompt
Establish architecture guidelines for:

1. Component Organization:
   - Atomic design folder structure
   - Component categorization
   - Naming conventions
   - File organization

2. Component Composition:
   - Component interfaces
   - Props structure
   - Event handling
   - State management
   - Context usage

3. Business Logic Separation:
   - Container components
   - Presentation components
   - Custom hooks
   - Utils/Helpers

4. Cross-cutting Concerns:
   - Error boundaries
   - Loading states
   - Authentication
   - Permissions
   - Analytics

Include documentation for best practices and example implementations.
```

---

## 16. State Management Architecture

```prompt
Design a comprehensive state management system:

1. Global State:
   - Authentication state
   - User preferences
   - App configuration
   - Theme settings
   - Feature flags

2. Local State Management:
   - Component state patterns
   - React Query/SWR setup
   - Cache management
   - State persistence

3. Real-time Updates:
   - WebSocket integration
   - Server-sent events
   - Real-time state sync
   - Offline support

4. State Debugging:
   - DevTools integration
   - State logging
   - Time-travel debugging
   - Performance monitoring
```

## 17. Advanced Interaction Patterns

```prompt
Implement advanced interaction patterns:

1. Drag and Drop:
   - File upload
   - List reordering
   - Kanban boards
   - Tree structures

2. Infinite Scrolling:
   - Virtual scrolling
   - Load more patterns
   - Scroll restoration
   - Progressive loading

3. Contextual Actions:
   - Right-click menus
   - Quick actions
   - Keyboard shortcuts
   - Touch gestures

4. Advanced Selection:
   - Multi-select
   - Range selection
   - Bulk actions
   - Selection persistence
```

## 18. Progressive Web App Features

```prompt
Implement PWA capabilities:

1. Offline Support:
   - Service worker setup
   - Offline-first architecture
   - Background sync
   - Cache strategies

2. Installation Experience:
   - App manifest
   - Install prompts
   - Home screen icons
   - Splash screens

3. Push Notifications:
   - Notification system
   - Subscription management
   - Background messaging
   - Action handlers

4. Performance:
   - Asset caching
   - Route pre-fetching
   - Resource prioritization
   - Analytics tracking
```

## 19. Micro-Frontend Architecture

```prompt
Design a micro-frontend architecture:

1. Module Federation:
   - Remote loading
   - Shared dependencies
   - Version management
   - Build configuration

2. Communication:
   - Event bus
   - Shared state
   - API contracts
   - Type sharing

3. Deployment:
   - Independent deployments
   - Versioning strategy
   - Rollback mechanisms
   - Feature flags

4. Development:
   - Local development
   - Testing strategy
   - Documentation
   - Team coordination
```

## 20. Advanced Security Features

```prompt
Implement security features:

1. Input Protection:
   - XSS prevention
   - CSRF protection
   - Input sanitization
   - File upload security

2. Authentication:
   - Biometric authentication
   - Hardware key support
   - Session management
   - Token rotation

3. Authorization:
   - Fine-grained permissions
   - Role-based access
   - Feature flags
   - Content policies

4. Security Monitoring:
   - Audit logging
   - Security headers
   - Error handling
   - Vulnerability scanning
```

*Note: Each prompt should be executed in sequence, as later components may depend on earlier foundations. Adjust prompts based on specific project requirements and technical constraints.* 