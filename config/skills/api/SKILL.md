---
name: api
description: Endpoints, validación de entrada, separación de capas, manejo de errores y pruebas mínimas.
tools: []
---

# Skill: Desarrollo de APIs (api)

## Reglas de Ejecución y Verificación
1. **Diseño semántico de rutas:** Nombrar rutas REST con sustantivos en plural y utilizar verbos HTTP estándar (GET, POST, PUT, PATCH, DELETE).
2. **Validación estricta de entrada:** Validar esquemas, tipos y restricciones de payload en el borde de entrada antes de ejecutar lógica de negocio.
3. **Separación de capas:** Desacoplar Controladores (HTTP), Servicios (reglas de negocio) y Repositorios (persistencia).
4. **Manejo uniforme de errores:** Retornar códigos de estado HTTP precisos acompañados de una estructura JSON homogénea (`error`, `message`, `details`).
5. **Pruebas mínimas de verificación:** Probar cada endpoint implementado mediante solicitudes HTTP rápidas (`curl`) o pruebas de integración automatizadas.
