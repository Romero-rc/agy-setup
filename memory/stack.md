# Memoria de Stack Tecnológico

## Backend y APIs
- **Diseño de rutas:** Estándar REST semántico (`/api/v1/recurso`) con sustantivos en plural y verbos HTTP correctos (GET, POST, PUT, PATCH, DELETE).
- **Validación en el borde:** Validar esquemas y tipos de datos (DTOs) antes de pasar la carga a la lógica de negocio.
- **Arquitectura en capas:** Separar estrictamente Controlador (HTTP) -> Servicio (negocio) -> Repositorio (acceso a datos).
- **Respuestas de error:** Respuestas JSON estructuradas con códigos HTTP estándar (400 datos inválidos, 401 sin autenticación, 403 sin permiso, 404 no encontrado, 500 error interno).

## Frontend y UI
- **Componentes atómicos:** Componentes pequeños, desacoplados y con responsabilidad única.
- **Gestión de 4 estados:** Todo componente con carga de datos debe contemplar explícitamente:
  1. *Carga (loading)*: Indicador o skeleton visual.
  2. *Error*: Mensaje descriptivo con acción de reintento.
  3. *Vacío (empty)*: Estado informativo cuando no hay datos.
  4. *Éxito (success)*: Renderizado normal de la información.
- **Diseño adaptable:** Layouts fluidos (Flexbox/Grid) con enfoque mobile-first.
- **Accesibilidad básica:** Etiquetas HTML semánticas, contraste adecuado y foco interactivo por teclado.

## Bases de Datos
- **Relacionales:** Normalizar en Tercera Forma Normal (3FN), definir claves foráneas explícitas y tipos exactos (evitar tipos genéricos).
- **NoSQL:** Estructurar colecciones o documentos orientados al patrón principal de lectura y consulta.
- **Consultas seguras:** Emplear siempre consultas parametrizadas o bindings preparados para prevenir inyección SQL.
- **Rendimiento:** Indexar campos clave de búsqueda/filtro/JOIN y evitar lecturas N+1 mediante `JOIN` o eager loading.

## Entorno y Contenedores
- **Dockerfiles ligeros:** Compilación en múltiples etapas (multi-stage), imágenes base reducidas (alpine/distroless) y ejecución bajo usuario no-root.
- **Docker Compose:** Definir servicios con redes internas aisladas y variables de entorno externas.
- **Configuración desacoplada:** Nunca incluir contraseñas o tokens en código ni en imágenes; usar `.env.example` como plantilla.
