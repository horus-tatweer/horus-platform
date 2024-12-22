# Container Diagram

```c4plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

LAYOUT_WITH_LEGEND()

title Container diagram for Mega Solution Platform

Person(customer, "Customer", "A user of the platform")
Person(admin, "Administrator", "System administrator")

System_Boundary(c1, "Mega Solution Platform") {
    Container(web_app, "Web Application", "Next.js", "Provides web interface")
    Container(mobile_app, "Mobile App", "React Native", "Provides mobile interface")
    
    Container(api_gateway, "API Gateway", "NestJS", "Handles API routing and authentication")
    
    Container(auth_service, "Auth Service", "NestJS", "Handles authentication and authorization")
    Container(user_service, "User Service", "NestJS", "Manages user data")
    Container(project_service, "Project Service", "NestJS", "Manages project data")
    Container(comms_service, "Communications Service", "NestJS", "Handles communications")
    
    ContainerDb(auth_db, "Auth DB", "PostgreSQL", "Stores auth data")
    ContainerDb(user_db, "User DB", "PostgreSQL", "Stores user data")
    ContainerDb(project_db, "Project DB", "PostgreSQL", "Stores project data")
    
    Container(cache, "Cache", "Redis", "Handles caching")
    Container(message_bus, "Message Bus", "RabbitMQ", "Handles async communication")
}

System_Ext(email_system, "Email System", "External email service")
System_Ext(payment_system, "Payment Gateway", "External payment processing")

Rel(customer, web_app, "Uses", "HTTPS")
Rel(customer, mobile_app, "Uses", "HTTPS")
Rel(admin, web_app, "Manages", "HTTPS")

Rel(web_app, api_gateway, "Makes API calls to", "HTTPS")
Rel(mobile_app, api_gateway, "Makes API calls to", "HTTPS")

Rel(api_gateway, auth_service, "Routes auth requests to", "gRPC")
Rel(api_gateway, user_service, "Routes user requests to", "gRPC")
Rel(api_gateway, project_service, "Routes project requests to", "gRPC")
Rel(api_gateway, comms_service, "Routes communication requests to", "gRPC")

Rel(auth_service, auth_db, "Reads from and writes to", "SQL")
Rel(user_service, user_db, "Reads from and writes to", "SQL")
Rel(project_service, project_db, "Reads from and writes to", "SQL")

Rel(auth_service, cache, "Caches data in", "Redis Protocol")
Rel(user_service, cache, "Caches data in", "Redis Protocol")
Rel(project_service, cache, "Caches data in", "Redis Protocol")

Rel(auth_service, message_bus, "Publishes events to", "AMQP")
Rel(user_service, message_bus, "Publishes events to", "AMQP")
Rel(project_service, message_bus, "Publishes events to", "AMQP")
Rel(comms_service, message_bus, "Subscribes to", "AMQP")

Rel(comms_service, email_system, "Sends emails via", "SMTP")
Rel(project_service, payment_system, "Processes payments via", "HTTPS/API")

@enduml
```
