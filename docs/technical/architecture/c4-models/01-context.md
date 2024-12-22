# System Context Diagram

```c4plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Context.puml

LAYOUT_WITH_LEGEND()

title System Context diagram for Mega Solution Platform

Person(customer, "Customer", "A user of the platform")
Person(admin, "Administrator", "System administrator")

System(megaPlatform, "Mega Solution Platform", "Provides comprehensive business solutions")

System_Ext(emailSystem, "Email System", "External email service")
System_Ext(paymentSystem, "Payment Gateway", "External payment processing")
System_Ext(authProvider, "Identity Provider", "External authentication")

Rel(customer, megaPlatform, "Uses", "HTTPS")
Rel(admin, megaPlatform, "Manages", "HTTPS")
Rel(megaPlatform, emailSystem, "Sends emails", "SMTP")
Rel(megaPlatform, paymentSystem, "Processes payments", "HTTPS/API")
Rel(megaPlatform, authProvider, "Authenticates users", "OAuth2")

@enduml
```
