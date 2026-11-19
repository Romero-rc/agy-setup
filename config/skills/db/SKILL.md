---
name: db
description: Modelado relacional (3FN, tipos exactos, claves foráneas) y NoSQL, consultas parametrizadas, índices y evitar N+1.
tools: []
---

# Skill: Bases de Datos (db)

## Reglas de Ejecución y Verificación
1. **Modelado formal relacional:** Diseñar en Tercera Forma Normal (3FN), declarando claves primarias, claves foráneas explícitas y tipos de datos precisos.
2. **Esquematización NoSQL contextual:** En colecciones NoSQL, modelar documentos optimizados para los patrones de acceso y consultas más frecuentes.
3. **Consultas parametrizadas obligatorias:** Usar siempre parámetros ligados / sentencias preparadas; prohibida la interpolación directa de cadenas.
4. **Indexación y optimización:** Crear índices en columnas empleadas en cláusulas WHERE, JOIN y ORDER BY, evitando sobreindexación innecesaria.
5. **Mitigación y verificación de N+1:** Implementar JOINs o carga anticipada (eager loading) y validar planes de ejecución con `EXPLAIN`.
