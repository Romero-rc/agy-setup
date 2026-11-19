#!/usr/bin/env fish
# ==============================================================================
# install.fish - Instalador portable para configuración de Antigravity CLI (agy)
# Idempotente y seguro: crea directorios base y enlaces simbólicos.
# ==============================================================================

# 1. Detección portable del directorio de origen
set -l SCRIPT_DIR (status dirname)
set -l REPO_DIR (builtin cd "$SCRIPT_DIR"; and pwd -P)
set -l TARGET_DIR "$HOME/.gemini"

echo "[install.fish] Directorio del repositorio: $REPO_DIR"
echo "[install.fish] Directorio de destino:      $TARGET_DIR"

# 2. Creación de directorios base requeridos
mkdir -p "$TARGET_DIR/config/skills"
mkdir -p "$TARGET_DIR/memory"

# 3. Enlazar archivos si el script se ejecuta desde otra ubicación (ej. dotfiles)
if test "$REPO_DIR" != "$TARGET_DIR"
    echo "[install.fish] Creando enlaces simbólicos hacia $TARGET_DIR..."

    # GEMINI.md
    if test -f "$REPO_DIR/GEMINI.md"
        ln -sf "$REPO_DIR/GEMINI.md" "$TARGET_DIR/GEMINI.md"
        echo "  -> Enlazado: GEMINI.md"
    end

    # memory/
    if test -d "$REPO_DIR/memory"
        for mem_file in "$REPO_DIR/memory/"*.md
            if test -f "$mem_file"
                set -l base_name (basename "$mem_file")
                ln -sf "$mem_file" "$TARGET_DIR/memory/$base_name"
                echo "  -> Enlazado: memory/$base_name"
            end
        end
    end

    # config/skills/
    if test -d "$REPO_DIR/config/skills"
        for skill_dir in "$REPO_DIR/config/skills/"*
            if test -d "$skill_dir"
                set -l skill_name (basename "$skill_dir")
                mkdir -p "$TARGET_DIR/config/skills/$skill_name"
                if test -f "$skill_dir/SKILL.md"
                    ln -sf "$skill_dir/SKILL.md" "$TARGET_DIR/config/skills/$skill_name/SKILL.md"
                    echo "  -> Enlazado: config/skills/$skill_name/SKILL.md"
                end
            end
        end
    end
else
    echo "[install.fish] Repositorio ubicado en destino ($TARGET_DIR). Verificando estructura..."
end

# 4. Enlace idempotente para antigravity-cli/skills si antigravity-cli existe
if test -d "$TARGET_DIR/antigravity-cli"
    set -l CLI_SKILLS "$TARGET_DIR/antigravity-cli/skills"
    if test -L "$CLI_SKILLS"
        set -l CURRENT_TARGET (readlink "$CLI_SKILLS")
        if test "$CURRENT_TARGET" != "$TARGET_DIR/config/skills" -a "$CURRENT_TARGET" != "../config/skills"
            ln -sfn "$TARGET_DIR/config/skills" "$CLI_SKILLS" 2>/dev/null
            echo "  -> Enlace actualizado: antigravity-cli/skills -> $TARGET_DIR/config/skills"
        else
            echo "  -> Enlace existente y válido: antigravity-cli/skills"
        end
    else if not test -e "$CLI_SKILLS"
        ln -s "$TARGET_DIR/config/skills" "$CLI_SKILLS" 2>/dev/null
        echo "  -> Enlace creado: antigravity-cli/skills -> $TARGET_DIR/config/skills"
    else
        echo "  -> AVISO: $CLI_SKILLS ya existe como directorio físico; se conservan sus archivos."
    end
end

# 5. Asegurar permisos de ejecución en el script
chmod +x "$REPO_DIR/install.fish" 2>/dev/null

echo "[install.fish] Configuración completada e idempotente."
