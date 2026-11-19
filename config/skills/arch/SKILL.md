---
name: arch
description: Diseño rápido de arquitectura, carpetas, contratos de datos y riesgos clave antes de codificar.
tools: []
---

# Skill: Arquitectura de Software (arch)

## Reglas de Ejecución y Verificación
1. **Definición de estructura y módulos:** Diseñar la jerarquía de carpetas y los límites de cada módulo antes de crear archivos de implementación.
2. **Contratos de datos previos:** Especificar esquemas, DTOs e interfaces de comunicación entre componentes como primer paso de diseño.
3. **Análisis de riesgos y trade-offs:** Documentar dependencias críticas, impacto en latencia y decisiones de acoplamiento antes de adoptar tecnologías o librerías.
4. **Principio de responsabilidad única:** Asegurar que cada módulo o capa tenga un propósito claro, evitando dependencias circulares.
5. **Verificación arquitectural:** Revisar la coherencia de importaciones y comprobar que las capas de negocio no dependan directamente de infraestructura.
