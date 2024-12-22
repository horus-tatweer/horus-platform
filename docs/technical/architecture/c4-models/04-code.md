# Code Diagram - Auth Controller

```c4plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Code.puml

LAYOUT_WITH_LEGEND()

title Code diagram for Auth Controller

Class(auth_controller, "AuthController", "NestJS Controller", "Handles authentication endpoints")
Class(auth_service, "AuthService", "NestJS Service", "Authentication business logic")
Class(auth_guard, "AuthGuard", "NestJS Guard", "Route protection")
Class(jwt_strategy, "JwtStrategy", "Passport Strategy", "JWT validation")
Class(local_strategy, "LocalStrategy", "Passport Strategy", "Username/password validation")

Class(auth_dto, "AuthDto", "DTO", "Data transfer objects") {
    +username: string
    +password: string
    +validate(): boolean
}

Interface(auth_repository, "IAuthRepository", "Interface", "Data access contract") {
    +findByUsername(username: string): Promise<User>
    +save(user: User): Promise<User>
}

auth_controller --> auth_service : uses
auth_controller --> auth_guard : protected by
auth_controller --> auth_dto : validates input with

auth_service --> auth_repository : implements
auth_service --> jwt_strategy : uses
auth_service --> local_strategy : uses

@enduml
```
