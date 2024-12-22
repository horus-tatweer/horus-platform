# Component Diagram - Auth Service

```c4plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Component.puml

LAYOUT_WITH_LEGEND()

title Component diagram for Auth Service

Container_Boundary(auth_service, "Auth Service") {
    Component(auth_controller, "Auth Controller", "NestJS Controller", "Handles authentication requests")
    Component(auth_service_comp, "Auth Service", "NestJS Service", "Implements authentication logic")
    Component(token_service, "Token Service", "NestJS Service", "Manages JWT tokens")
    Component(user_service, "User Service", "NestJS Service", "Handles user operations")
    Component(password_service, "Password Service", "NestJS Service", "Handles password operations")
    Component(mfa_service, "MFA Service", "NestJS Service", "Handles 2FA")
    Component(auth_repository, "Auth Repository", "TypeORM Repository", "Data access layer")
}

ContainerDb(auth_db, "Auth DB", "PostgreSQL", "Stores authentication data")
Container(cache, "Redis Cache", "Redis", "Caches auth data")
Container(message_bus, "Message Bus", "RabbitMQ", "Event bus")

System_Ext(email_service, "Email Service", "Sends emails")
System_Ext(sms_service, "SMS Service", "Sends SMS")

Rel(auth_controller, auth_service_comp, "Uses")
Rel(auth_service_comp, token_service, "Uses")
Rel(auth_service_comp, user_service, "Uses")
Rel(auth_service_comp, password_service, "Uses")
Rel(auth_service_comp, mfa_service, "Uses")
Rel(auth_service_comp, auth_repository, "Uses")

Rel(auth_repository, auth_db, "Reads from and writes to")
Rel(token_service, cache, "Stores tokens in")
Rel(auth_service_comp, message_bus, "Publishes events to")

Rel(mfa_service, email_service, "Sends codes via")
Rel(mfa_service, sms_service, "Sends codes via")

@enduml
```
