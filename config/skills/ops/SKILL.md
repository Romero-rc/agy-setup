---
name: ops
description: Dockerfiles, compose, variables de entorno, servicios Linux y diagnóstico de puertos/procesos/logs.
tools: []
---

# Skill: Operaciones y Entornos (ops)

## Reglas de Ejecución y Verificación
1. **Dockerfiles reproducibles y seguros:** Aplicar construcción en múltiples etapas (multi-stage), imágenes base reducidas y usuarios sin privilegios (no-root).
2. **Composición de servicios:** Declarar servicios, redes aisladas y volúmenes persistentes en Docker Compose con políticas de reinicio adecuadas.
3. **Variables de entorno seguras:** Inyectar configuración vía variables de entorno documentadas en `.env.example`, sin credenciales quemadas.
4. **Gestión de servicios Linux:** Configurar daemons y servicios systemd con dependencias claras y reinicio automático ante fallos.
5. **Diagnóstico y verificación operativa:** Auditar puertos con `ss -tulpn`, supervisar procesos con `ps` y monitorear logs en tiempo real con `journalctl` o `docker logs`.
