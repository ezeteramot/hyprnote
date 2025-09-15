# Contribuyendo a Teramot Note Taker

¡Gracias por tu interés en contribuir a Teramot Note Taker! Este documento describe cómo puedes ayudar a mejorar el proyecto.

## Código de Conducta

Al participar en este proyecto, aceptas seguir nuestro código de conducta basado en los principios del software libre y la colaboración respetuosa.

## Formas de Contribuir

### 🐛 Reportar Bugs
- Usa los [GitHub Issues](https://github.com/ezeteramot/hyprnote/issues)
- Describe el problema claramente
- Incluye pasos para reproducir el bug
- Menciona tu sistema operativo y versión

### 💡 Sugerir Nuevas Características
- Abre un [GitHub Discussion](https://github.com/ezeteramot/hyprnote/discussions)
- Explica el caso de uso
- Describe la funcionalidad propuesta
- Considera la implementación técnica

### 🌐 Traducción y Localización
- Ayuda con traducciones al español argentino
- Revisa términos técnicos y empresariales
- Mejora la experiencia para usuarios locales

### 💻 Contribuir Código

#### Configuración del Entorno de Desarrollo

1. **Fork el repositorio**
```bash
git clone https://github.com/ezeteramot/hyprnote.git
cd hyprnote
git checkout teramot-note-taker
```

2. **Instalar dependencias**
```bash
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update stable

# Node.js y npm
nvm install 18
npm install -g pnpm

# Instalar dependencias del proyecto
pnpm install
```

3. **Configurar el entorno**
```bash
# Crear archivo de configuración local
cp .env.example .env.local
# Editar .env.local con tus configuraciones
```

4. **Ejecutar en modo desarrollo**
```bash
pnpm tauri dev
```

#### Proceso de Desarrollo

1. **Crear una rama para tu característica**
```bash
git checkout -b feature/nueva-caracteristica
```

2. **Hacer cambios siguiendo las convenciones**
   - Usa conventional commits: `feat:`, `fix:`, `docs:`, etc.
   - Escribe tests para nuevas funcionalidades
   - Actualiza documentación si es necesario

3. **Testing**
```bash
# Tests de Rust
cargo test

# Tests de frontend
pnpm test

# Linting
cargo clippy
pnpm lint
```

4. **Crear Pull Request**
   - Describe claramente los cambios
   - Referencia issues relacionados
   - Incluye screenshots si hay cambios en UI

## Estándares de Código

### Rust
- Usar `cargo fmt` para formateo
- Pasar `cargo clippy` sin warnings
- Documentar funciones públicas
- Escribir tests unitarios

### TypeScript/React
- Seguir convenciones de ESLint
- Usar TypeScript strict mode
- Componentes funcionales con hooks
- Props interfaces tipadas

### Commits
Usar [Conventional Commits](https://www.conventionalcommits.org/):
```
feat: add transcription optimization for Argentine Spanish
fix: resolve audio buffer overflow in long meetings
docs: update installation guide for Ubuntu
style: format code according to rustfmt
test: add unit tests for AI summarization
refactor: extract audio processing into separate module
```

## Áreas Prioritarias para Contribuciones

### 🎯 Alta Prioridad
- Optimización para español argentino
- Integración con servicios locales
- Mejoras de performance
- Testing y QA
- Documentación en español

### 🚀 Media Prioridad
- Nuevas integraciones
- Características de UI/UX
- Automatización de CI/CD
- Plugins y extensiones

### 🔮 Baja Prioridad
- Características experimentales
- Optimizaciones avanzadas
- Integración con servicios internacionales

## Proceso de Review

1. **Review Automático**: CI/CD verifica tests y linting
2. **Review Técnico**: Mantenedores revisan código y arquitectura
3. **Testing**: Verificación manual en diferentes plataformas
4. **Aprobación**: Merge después de aprobación de mantenedores

## Licenciamiento

Al contribuir a Teramot Note Taker, aceptas que tu código sea licenciado bajo GPL-3.0. Esto significa:

- Tu código será software libre
- Otros pueden usar, modificar y distribuir tu código
- Trabajos derivados deben mantener la misma licencia
- El código fuente siempre estará disponible

## Reconocimientos

Todos los contribuidores serán reconocidos en:
- Archivo AUTHORS.md
- Créditos en la aplicación
- Release notes
- Documentación del proyecto

## Contacto

- **Issues técnicos**: [GitHub Issues](https://github.com/ezeteramot/hyprnote/issues)
- **Discusiones generales**: [GitHub Discussions](https://github.com/ezeteramot/hyprnote/discussions)
- **Email de mantenedores**: dev@teramot.com.ar
- **Telegram de desarrollo**: @TeramotNoteTakerDev

## Recursos Útiles

- [Documentación de Tauri](https://tauri.app/v1/guides/)
- [Guía de React](https://react.dev/)
- [Rust Book](https://doc.rust-lang.org/book/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Conventional Commits](https://www.conventionalcommits.org/)

¡Esperamos tus contribuciones para hacer de Teramot Note Taker la mejor herramienta de notas con IA para profesionales argentinos!

---

## Información Original de Desarrollo (Referencia)

### Requisitos Técnicos
``` bash
# Installing the rust toolchain used for tauri and the backend libs
curl https://sh.rustup.rs -sSf | sh
# libomp is required for llama-cpp
brew install libomp
# cmake is required for whisper-rs
brew install cmake
# cidre uses this for audio capture and types
xcode-select --install
# Installing the tools
xcodebuild -runFirstLaunch
# Installing the tools
npm install -g pnpm turbo
```

### Instalación de Desarrollo
```bash
git clone https://github.com/ezeteramot/hyprnote.git
cd hyprnote
git checkout teramot-note-taker
pnpm install && turbo -F @teramot/note-taker tauri:dev
```

### Formateo
Usamos [dprint](https://dprint.dev/) para formatear el código.

```bash
dprint fmt
```

### Testing
```bash
cargo install cargo-insta
```
