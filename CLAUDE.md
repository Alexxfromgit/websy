# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build
mvn clean package

# Run (development profile)
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# Run database migrations
mvn flyway:migrate

# Full build and run
mvn clean install && mvn spring-boot:run
```

There are currently no tests configured in this project.

## Architecture

**Websy** is a Spring Boot 2.0.5 / Java 8 social web app (Twitter-like) with user posts, tags, file uploads, subscriptions, and email-based account activation.

### Layer structure

```
controller/   → HTTP layer (MainController, RegistrationController, UserController)
service/      → Business logic (UserService, MailSender)
domain/       → JPA entities (User, Message, Role enum)
repos/        → Spring Data repositories (UserRepo, MessageRepo)
config/       → Spring beans (WebSecurityConfig, MvcConfig, MailConfig, EncryptionConfig)
```

### Key flows

- **Authentication**: Spring Security with BCrypt (strength=8), remember-me, JDBC session persistence (`SPRING_SESSION` table)
- **Registration**: `RegistrationController` → Google reCAPTCHA validation → `UserService` creates inactive user → sends activation email → `/activate/{code}` enables account
- **Messaging**: `MainController` handles post creation with optional file upload (UUID-named files) and tag extraction; `MessageRepo` supports tag-based filtering
- **Subscriptions**: Many-to-many self-join on `usr` table via `user_subscriptions`; managed in `UserController`

### Configuration profiles

- `application.properties` — production (MySQL at remote host, `/home/d5enemy/uploads`)
- `application-dev.properties` — development (localhost MySQL, `/uploads` path, debug logging)

### Security rules

- Public: `/`, `/registration`, `/static/**`, `/activate/*`, `/login`
- Protected: everything else; `/user` routes require `ADMIN` role

### Database migrations (Flyway)

Located in `src/main/resources/db/migration/`:
- `V1` — initial schema (`usr`, `user_role`, `message`)
- `V2` — admin seed user
- `V3` — password encoding migration
- `V4` — `user_subscriptions` table

### Templates

Freemarker (`.ftl`) in `src/main/resources/templates/`. Mustache is a legacy dependency but no longer used.

### External integrations

- Gmail SMTP via `MailConfig` / `MailSender` service
- Google reCAPTCHA v2 called via `RestTemplate` in `RegistrationController`
