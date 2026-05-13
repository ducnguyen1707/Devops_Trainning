# Spring Boot Jenkins Demo

A structured Spring Boot application designed for testing Jenkins CI/CD pipelines with Java 21, Maven 3, and PostgreSQL.

## Project Overview

This project demonstrates a production-ready Spring Boot application with:
- **Java 21** - Latest LTS version
- **Spring Boot 3.2.1** - Latest stable release
- **Maven 3** - Build automation
- **PostgreSQL** - Relational database
- **Docker & Docker Compose** - Containerization
- **JUnit 5** - Unit and integration testing
- **REST API** - User management endpoints

## Prerequisites

### Required Software
- **Java 21 LTS** - [Download](https://www.oracle.com/java/technologies/downloads/#java21)
- **Maven 3.8+** - [Download](https://maven.apache.org/download.cgi)
- **Docker** - [Download](https://www.docker.com/products/docker-desktop)
- **Docker Compose** - Included with Docker Desktop

### Verify Installation
```bash
java -version
mvn -version
docker --version
docker-compose --version
```

## Project Structure

```
spring-boot-jenkins-demo/
├── src/
│   ├── main/
│   │   ├── java/com/demo/
│   │   │   ├── Application.java          # Main Spring Boot entry point
│   │   │   ├── controller/
│   │   │   │   ├── UserController.java   # REST API endpoints
│   │   │   │   └── HealthController.java # Health check endpoint
│   │   │   ├── model/
│   │   │   │   └── User.java             # JPA Entity
│   │   │   └── repository/
│   │   │       └── UserRepository.java   # Data access layer
│   │   └── resources/
│   │       └── application.yml           # Application config
│   └── test/
│       ├── java/com/demo/
│       │   └── controller/
│       │       └── UserControllerTest.java
│       └── resources/
│           └── application-test.yml
├── docker-compose.yml                    # PostgreSQL setup
├── Dockerfile                            # Application container
├── Jenkinsfile                           # Jenkins pipeline
├── pom.xml                               # Maven configuration
├── README.md                             # This file
└── .gitignore
```

## Getting Started

### 1. Clone the Repository
```bash
cd /home/ubuntu/Devops_Trainning/CICD/spring-boot-jenkins-demo
```

### 2. Start PostgreSQL Database
```bash
docker-compose up -d
```

Verify the database is running:
```bash
docker-compose ps
```

### 3. Build the Application
```bash
mvn clean package
```

### 4. Run the Application
```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8081`

### 5. Test the Application
```bash
# Run unit tests
mvn test

# Run all tests including integration tests
mvn verify
```

## API Endpoints

### Health Check
```bash
GET http://localhost:8081/health
```

**Response:**
```json
{
  "status": "UP",
  "message": "Application is healthy"
}
```

### Get All Users
```bash
GET http://localhost:8081/api/users
```

### Get User by ID
```bash
GET http://localhost:8081/api/users/{id}
```

### Create User
```bash
POST http://localhost:8081/api/users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "1234567890"
}
```

### Update User
```bash
PUT http://localhost:8081/api/users/{id}
Content-Type: application/json

{
  "name": "Jane Doe",
  "email": "jane@example.com",
  "phone": "0987654321"
}
```

### Delete User
```bash
DELETE http://localhost:8081/api/users/{id}
```

## Testing with cURL

### Health Check
```bash
curl -X GET http://localhost:8081/health
```

### Create a User
```bash
curl -X POST http://localhost:8081/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","phone":"1234567890"}'
```

### Get All Users
```bash
curl -X GET http://localhost:8081/api/users
```

### List Database Tables
```bash
docker exec -it demo-postgres psql -U demo_user -d demo_db -c "\dt"
```

## Docker Setup

### Start Database Only
```bash
docker-compose up -d postgres
```

### View Logs
```bash
docker-compose logs -f postgres
```

### Stop and Remove Containers
```bash
docker-compose down
```

### Access PostgreSQL CLI
```bash
docker exec -it demo-postgres psql -U demo_user -d demo_db
```

**Sample SQL Commands:**
```sql
\dt                              -- List tables
SELECT * FROM users;            -- View all users
\q                               -- Quit
```

curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /bin
eksctl version
