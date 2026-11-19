---
name: qa
description: Reproducir el fallo, aislar la causa, ejecutar pruebas y verificar antes de cerrar.
tools: []
---

# Skill: Control de Calidad y Pruebas (qa)

## Reglas de Ejecución y Verificación
1. **Reproducción previa verificable:** Reproducir el error con un comando o caso de prueba concreto antes de modificar código fuente.
2. **Aislamiento de la causa raíz:** Analizar stacktraces y logs para determinar el origen exacto del fallo y descartar efectos colaterales.
3. **Pruebas automatizadas focalizadas:** Escribir pruebas unitarias o de integración que fallen antes del parche y pasen de forma limpia tras la corrección.
4. **Verificación de no regresión:** Ejecutar la suite completa de pruebas relevante para comprobar que los cambios no afectaron otras funciones.
5. **Cierre y documentación clara:** Validar el resultado esperado en el entorno real y redactar commits atómicos siguiendo Conventional Commits.
