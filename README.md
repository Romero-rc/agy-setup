# Antigravity CLI Portable Config (~/.gemini)

Configuración personal, modular y portable para **Antigravity CLI (`agy`)**, optimizada para entornos Linux con **Fish Shell**.

Diseñada para versionarse en Git y sincronizarse entre diferentes equipos sin exponer secretos ni depender de rutas absolutas fijas de usuario.

---

## Estructura del Repositorio

```text
~/.gemini/
├── GEMINI.md              # Reglas globales de operación del agente (conciso, sin relleno)
├── memory/                # Contexto técnico modular
│   ├── entorno.md         # Convenciones de shell (Fish), puertos y notas de equipo
│   ├── stack.md           # Reglas prácticas para backend, frontend, DB y contenedores
│   └── errores-comunes.md # Plantilla y base de soluciones verificadas
├── config/
│   └── skills/            # Skills personalizadas con YAML frontmatter y reglas
│       ├── arch/SKILL.md  # Arquitectura modular y contratos de datos
│       ├── api/SKILL.md   # Diseño de endpoints, validación y capas
│       ├── ui/SKILL.md    # Componentes atómicos, 4 estados y accesibilidad
│       ├── db/SKILL.md    # Modelado 3FN/NoSQL, queries parametrizadas y N+1
│       ├── ops/SKILL.md   # Dockerfiles seguros, compose y diagnóstico
│       └── qa/SKILL.md    # Reproducción previa, aislamiento y pruebas
├── .gitignore             # Filtro estricto contra secretos, binarios y cachés locales
├── install.fish           # Script de instalación e inicialización de enlaces
└── README.md              # Documentación de uso y portabilidad
```

---

## Instalación en otra Distribución Linux

### Prerrequisitos
- **Fish Shell** (`fish >= 3.x`)
- **Git**
- **Antigravity CLI** (`agy`)

### Opción A: Clonar directamente en `~/.gemini`
```fish
git clone <URL_DE_TU_REPOSITORIO> ~/.gemini
cd ~/.gemini
chmod +x install.fish
./install.fish
```

### Opción B: Clonar en carpeta de dotfiles (ej. `~/dotfiles/gemini`)
El script detecta automáticamente su ubicación y crea los enlaces simbólicos idempotentes hacia `~/.gemini`:
```fish
git clone <URL_DE_TU_REPOSITORIO> ~/dotfiles/gemini
cd ~/dotfiles/gemini
chmod +x install.fish
./install.fish
```

---

## Uso Básico con `agy`

1. **Carga automática de directrices:** `agy` lee automáticamente `~/.gemini/GEMINI.md` al iniciar sesiones.
2. **Consulta puntual de memoria:** El agente consulta solo el archivo relevante dentro de `memory/` según la tarea en curso (`entorno.md`, `stack.md` o `errores-comunes.md`).
3. **Invocación de skills:** Las skills ubicadas en `config/skills/` se vinculan automáticamente al CLI y proveen directrices de ejecución y verificación para cada disciplina técnica (`arch`, `api`, `ui`, `db`, `ops`, `qa`).

---

## Seguridad y Portabilidad
- Este repositorio **nunca** debe contener tokens, claves privadas, archivos `.env` ni credenciales reales.
- Se emplean rutas relativas o variables de entorno estándar (`$HOME`) en lugar de nombres de usuario cableados.
