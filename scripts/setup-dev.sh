#!/bin/bash
set -e

# Script de configuración inicial para Teramot Note Taker
# Configuración del entorno de desarrollo para Argentina

echo "🇦🇷 Configurando Teramot Note Taker - Entorno de Desarrollo"
echo "==========================================================="

# Verificar prerrequisitos
echo "📋 Verificando prerrequisitos..."

# Verificar Git
if ! command -v git &> /dev/null; then
    echo "❌ Git no está instalado"
    exit 1
fi

# Verificar Rust
if ! command -v cargo &> /dev/null; then
    echo "❌ Rust no está instalado"
    echo "💡 Instala Rust: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js no está instalado"
    echo "💡 Instala Node.js: https://nodejs.org/"
    exit 1
fi

# Verificar pnpm
if ! command -v pnpm &> /dev/null; then
    echo "📦 Instalando pnpm..."
    npm install -g pnpm
fi

echo "✅ Prerrequisitos verificados"

# Configurar Git para el proyecto
echo "🔧 Configurando Git..."
git config --local user.name "Contribuidor Teramot"
git config --local core.autocrlf false

# Instalar dependencias de Rust
echo "🦀 Actualizando toolchain de Rust..."
rustup update stable
rustup component add clippy rustfmt

# Instalar herramientas adicionales
echo "🛠️ Instalando herramientas de desarrollo..."
cargo install cargo-watch
cargo install dprint || echo "⚠️ dprint ya instalado o no disponible"

# Verificar arquitectura para builds específicos
ARCH=$(uname -m)
OS=$(uname -s)

echo "💻 Sistema detectado: $OS ($ARCH)"

if [[ "$OS" == "Darwin" ]]; then
    # macOS
    if [[ "$ARCH" == "arm64" ]]; then
        export CARGO_BUILD_TARGET="aarch64-apple-darwin"
        echo "🍎 Configurado para Apple Silicon"
    else
        export CARGO_BUILD_TARGET="x86_64-apple-darwin"
        echo "🍎 Configurado para Intel Mac"
    fi
    
    # Verificar herramientas de macOS
    if ! xcode-select -p &> /dev/null; then
        echo "⚠️ Xcode Command Line Tools requeridas: xcode-select --install"
    fi
    
    # Verificar homebrew dependencies
    if command -v brew &> /dev/null; then
        echo "🍺 Verificando dependencias de Homebrew..."
        brew list libomp &> /dev/null || echo "⚠️ Instala libomp: brew install libomp"
        brew list cmake &> /dev/null || echo "⚠️ Instala cmake: brew install cmake"
    fi
    
elif [[ "$OS" == "Linux" ]]; then
    # Linux
    echo "🐧 Sistema Linux detectado"
    
    # Detectar distribución
    if command -v apt &> /dev/null; then
        echo "📦 Sistema basado en Debian/Ubuntu"
        echo "💡 Instala dependencias: sudo apt install build-essential pkg-config libgtk-3-dev libwebkit2gtk-4.0-dev"
    elif command -v dnf &> /dev/null; then
        echo "📦 Sistema basado en Red Hat/Fedora"
        echo "💡 Instala dependencias: sudo dnf install gcc-c++ pkg-config gtk3-devel webkit2gtk3-devel"
    elif command -v pacman &> /dev/null; then
        echo "📦 Sistema Arch Linux"
        echo "💡 Instala dependencias: sudo pacman -S base-devel gtk3 webkit2gtk"
    fi
fi

# Crear estructura de directorios de desarrollo
echo "📁 Creando estructura de directorios..."
mkdir -p .teramot/logs
mkdir -p .teramot/temp
mkdir -p .teramot/models

# Crear archivo de configuración local
if [ ! -f .env.local ]; then
    echo "⚙️ Creando configuración local..."
    cat > .env.local << EOF
# Configuración de desarrollo de Teramot Note Taker
TERAMOT_DEV_MODE=true
TERAMOT_LOG_LEVEL=debug
TERAMOT_LOCALE=es-AR
TERAMOT_TIMEZONE=America/Argentina/Buenos_Aires

# Configuración de IA (opcional)
# OPENAI_API_KEY=tu_clave_aqui
# ANTHROPIC_API_KEY=tu_clave_aqui

# Configuración de build
RUST_BACKTRACE=1
RUST_LOG=info
EOF
    echo "📝 Archivo .env.local creado. Edítalo según tus necesidades."
fi

# Instalar dependencias del proyecto
echo "📦 Instalando dependencias del proyecto..."
if pnpm install --frozen-lockfile; then
    echo "✅ Dependencias instaladas correctamente"
else
    echo "⚠️ Hubo problemas instalando algunas dependencias"
    echo "💡 Esto puede ser normal en la primera instalación"
fi

# Verificar build básico
echo "🔨 Verificando build básico..."
if cargo check --manifest-path apps/desktop/src-tauri/Cargo.toml; then
    echo "✅ Build básico exitoso"
else
    echo "⚠️ Build básico falló - puede ser por dependencias de red"
    echo "💡 Esto es común, continúa con el desarrollo"
fi

# Configurar hooks de Git
echo "🎣 Configurando hooks de Git..."
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Pre-commit hook para Teramot Note Taker

echo "🔍 Ejecutando verificaciones pre-commit..."

# Formatear código Rust
if cargo fmt --check; then
    echo "✅ Formato Rust OK"
else
    echo "🔧 Formateando código Rust..."
    cargo fmt
fi

# Linting Rust
if cargo clippy -- -D warnings; then
    echo "✅ Clippy OK"
else
    echo "❌ Clippy falló"
    exit 1
fi

echo "✅ Pre-commit exitoso"
EOF

chmod +x .git/hooks/pre-commit

# Mensaje final
echo ""
echo "🎉 ¡Configuración completa!"
echo "==========================================="
echo ""
echo "Próximos pasos:"
echo "1. 🔧 Revisar y editar .env.local"
echo "2. 🚀 Ejecutar: pnpm tauri dev"
echo "3. 🧪 Ejecutar tests: cargo test"
echo "4. 📖 Leer documentación: README-TERAMOT.md"
echo ""
echo "Comandos útiles:"
echo "• Desarrollo: pnpm tauri dev"
echo "• Build: pnpm tauri build"  
echo "• Tests: cargo test"
echo "• Linting: cargo clippy"
echo "• Formato: cargo fmt"
echo ""
echo "🤝 ¿Necesitas ayuda?"
echo "• GitHub: https://github.com/ezeteramot/hyprnote/issues"
echo "• Docs: README-TERAMOT.md"
echo ""
echo "¡Feliz desarrollo! 🇦🇷"