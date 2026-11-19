# Registro de Errores Comunes

## Plantilla de Registro

### [Nombre corto del error o síntoma]
- **Error:** Mensaje exacto de error o código de fallo reportado en consola.
- **Causa:** Origen técnico verificado (configuración, tipado, concurrencia, permisos).
- **Solución verificada:** Comando o cambio exacto que resuelve el problema de forma permanente.

---

## Casos Registrados

### Incompatibilidad de exportación de variables en Fish Shell
- **Error:** `fish: Unknown command: export` o `export VAR=value: command not found`
- **Causa:** Intento de usar sintaxis de Bash/POSIX dentro del entorno nativo de Fish Shell.
- **Solución verificada:** Usar el comando nativo de Fish:
  ```fish
  set -gx NOMBRE_VARIABLE "valor"
  ```
  Para eliminar la variable:
  ```fish
  set -e NOMBRE_VARIABLE
  ```

### Conflicto de puerto en uso (EADDRINUSE)
- **Error:** `Error: listen EADDRINUSE: address already in use :::3000`
- **Causa:** Un proceso previo o contenedor en segundo plano continúa escuchando en el puerto objetivo.
- **Solución verificada:** Identificar el proceso y liberarlo de forma controlada:
  ```fish
  ss -tulpn | grep :3000
  kill -15 <PID>
  ```
  Si se trata de un contenedor Docker:
  ```fish
  docker ps --filter "publish=3000" -q | xargs -r docker stop
  ```
