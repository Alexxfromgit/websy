# Websy

A social feed web application built with Spring Boot. Users can post messages, follow each other, upload files, and receive email notifications — all served via server-side rendered FreeMarker templates.

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Spring Boot 2.0.5 |
| Language | Java 8 |
| Database | MySQL 5.7+ |
| Migrations | Flyway |
| ORM | Spring Data JPA / Hibernate |
| Templates | FreeMarker |
| Security | Spring Security (form login, JDBC sessions) |
| Email | Spring Mail (Gmail SMTP) |
| CAPTCHA | Google reCAPTCHA v2 |

## Prerequisites

- Java 8+
- Maven 3.5+
- MySQL 5.7+ running on `localhost:3306` with a database named `websy`
- Gmail account with SMTP access (for email activation)
- Google reCAPTCHA v2 site/secret keys

## Getting Started

**1. Create the database**

```sql
CREATE DATABASE websy;
```

**2. Configure credentials**

Copy the properties file and fill in your values:

```bash
cp src/main/resources/application-dev.properties src/main/resources/application-dev.properties.local
```

Key properties to set:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/websy?useSSL=false
spring.datasource.username=<your-db-user>
spring.datasource.password=<your-db-password>

spring.mail.username=<your-gmail>
spring.mail.password=<your-gmail-app-password>

recaptcha.secret=<your-recaptcha-secret>

upload.path=/path/to/uploads
hostname=localhost:8080
```

**3. Run locally**

```bash
mvn spring-boot:run -Dspring-boot.run.arguments="--spring.profiles.active=dev"
```

The app starts on `http://localhost:8080`. Flyway migrations run automatically on startup.

**4. Build a production JAR**

```bash
mvn clean package
java -jar target/websy-1.0-SNAPSHOT.jar
```

## Deployment

`deploy.sh` automates a full deploy to a remote Linux server via SSH:

```bash
chmod +x deploy.sh
./deploy.sh
```

It builds the JAR, copies it to the server with `scp`, kills the running process, and restarts with `nohup`. Requires an SSH key at `~/.ssh/id_rsa` with access to the target host.

## Features

- **Registration & activation** — new accounts require email verification before login
- **Social feed** — post messages with optional file attachments; filter by tag
- **Subscriptions** — follow/unfollow users; view a personal channel feed
- **User profiles** — editable username, email, and profile photo
- **Admin panel** — manage all users and roles
- **CAPTCHA protection** — reCAPTCHA on the registration form

## Project Structure

```
src/main/
├── java/com/alexxrw/websy/
│   ├── Application.java          # Entry point
│   ├── config/                   # Security, MVC, Mail, Encryption config
│   ├── controller/               # MVC controllers (Main, Registration, User)
│   ├── domain/                   # JPA entities (User, Message, Role)
│   ├── repos/                    # Spring Data repositories
│   └── service/                  # Business logic (UserService, MailSender)
└── resources/
    ├── application.properties    # Production config
    ├── application-dev.properties# Development config
    ├── db/migration/             # Flyway SQL migrations (V1–V4)
    └── templates/                # FreeMarker templates + static assets
```

## Configuration Profiles

| Profile | Hostname | Upload path | Mail debug |
|---|---|---|---|
| default (prod) | `35.246.185.137` | `/home/alexx_rw/uploads` | off |
| `dev` | `localhost:8080` | `/uploads` | on |

Activate a profile: `--spring.profiles.active=dev`
