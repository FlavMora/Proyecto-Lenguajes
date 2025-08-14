# Copilot Instructions for Ferreteria-Grupo1

## Project Overview
- This is a full-featured enterprise management system for hardware stores, built with Spring Boot (Java backend) and a Thymeleaf/Bootstrap/jQuery frontend.
- Major modules: inventory, sales, clients, suppliers, employees, roles, and reporting.
- Data is stored in Oracle Database. All DB access is via Spring Data JPA repositories and stored procedures.

## Architecture & Key Patterns
- **Backend:**
  - Main code in `ferreteria-sistema/src/main/java/com/ferreteria/sistema/`
  - Follows layered architecture: `entity/` (JPA), `repository/`, `service/`, `controller/rest/` (API), `controller/web/` (MVC)
  - Security via Spring Security, roles managed in DB and code (`SecurityConfig`)
  - Business logic is in `service/` layer; controllers are thin
- **Frontend:**
  - HTML templates in `src/main/resources/templates/` (Thymeleaf)
  - Static assets in `src/main/resources/static/` (CSS/JS)
  - JS modules per entity (e.g., `clientes.js`, `productos.js`)

## Developer Workflows
- **Build:**
  - Use Maven (`mvn clean package`) in `ferreteria-sistema/` to build the backend
  - Output JAR: `ferreteria-sistema/target/sistema-ferreteria-1.0.0.jar`
- **Run:**
  - Configure DB in `src/main/resources/application.properties`
  - Run with `java -jar target/sistema-ferreteria-1.0.0.jar`
- **Database:**
  - Initialize schema with `ProyectoLenguajes.sql` (root folder)
  - DB connection details must match Oracle XE or production as per environment
- **Testing:**
  - No explicit test suite found; manual testing via web UI and Swagger (`/swagger-ui.html`)

## Project-Specific Conventions
- All new entities: create in `entity/`, repository in `repository/`, service in `service/`, REST controller in `controller/rest/`, web controller in `controller/web/`, template in `templates/`
- Role/permission changes: update DB, `SecurityConfig`, and use `@PreAuthorize` in controllers
- Use `sec:authorize` in Thymeleaf templates for UI-level security
- JS and CSS for each module should be placed in `static/js/` and `static/css/`

## Integration Points
- Oracle DB (JDBC URL in properties)
- Swagger UI for API docs
- Chart.js for dashboard stats

## Examples
- To add a new module (e.g., "Pedidos"):
  1. Create JPA entity, repository, service, REST and web controllers
  2. Add HTML template and JS module
  3. Register routes and update security as needed

Refer to `ferreteria-sistema/README.md` for more details and setup steps.
