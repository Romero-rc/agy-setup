# Memoria de Entorno

## Shell (Fish)
- **Variables de entorno:** Usar `set -gx VARIABLE "valor"` para exportar y `set -e VARIABLE` para borrar. No usar sintaxis `export VAR=valor`.
- **Condicionales y bucles:** 
  - Condicional: `if test -f ruta/al/archivo; ...; else; ...; end`
  - Bucle: `for item in $lista; ...; end`
- **Rutas de scripts:** Obtener la ruta del script actual de forma portable con `status dirname`.
- **Comandos y tuberías:** Encadenar con `and` / `or` en lugar de `&&` / `||` para máxima compatibilidad con versiones previas de Fish.

## Puertos y Rutas Locales Habituales
- **Puertos de desarrollo:**
  - `3000`: Frontend / dev servers (Vite, Next.js).
  - `8000` / `8080`: Servicios backend y APIs (FastAPI, Express, Go).
  - `5432`: PostgreSQL local.
  - `6379`: Redis cache local.
- **Rutas estándar del usuario:**
  - `~/.gemini/`: Configuración portable, memoria y skills de Antigravity.
  - `~/.local/bin/`: Binarios y ejecutables del usuario.
  - `~/projects/`: Espacio de trabajo habitual para repositorios.
  - Usar siempre `$HOME` o rutas relativas; evitar rutas absolutas fijadas a un usuario específico.

## Notas del Equipo
- **Inspección de puertos:** Antes de iniciar servicios locales, comprobar disponibilidad con `ss -tulpn | grep <puerto>`.
- **Procesos:** Verificar procesos activos con `pgrep -a <nombre>` y evitar procesos huérfanos.
- **Portabilidad:** Todas las configuraciones y scripts deben funcionar sin suponer nombres de usuario fijos ni dependencias no estándar.
