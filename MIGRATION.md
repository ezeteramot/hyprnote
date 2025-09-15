# Guía de Migración: Hyprnote → Teramot Note Taker

## Introducción

Esta guía ayuda a desarrolladores y usuarios a migrar desde Hyprnote hacia **Teramot Note Taker**, el fork open source optimizado para Argentina bajo licencia GPL-3.0.

## Diferencias Principales

### Filosofía y Licenciamiento
| Aspecto | Hyprnote | Teramot Note Taker |
|---------|----------|-------------------|
| **Licencia** | Propietaria | GPL-3.0 (Software Libre) |
| **Código** | Parcialmente cerrado | 100% Open Source |
| **Objetivo** | Mercado global | Mercado argentino + global |
| **Privacidad** | Local-first | Local-first + cumplimiento argentino |
| **Comunidad** | Cerrada | Abierta y colaborativa |

### Cambios Técnicos
| Componente | Cambio | Razón |
|------------|--------|-------|
| **Nombre del paquete** | `@hypr/desktop` → `@teramot/note-taker` | Rebranding |
| **Identificador** | `com.hyprnote.dev` → `com.teramot.notetaker` | Nueva identidad |
| **Binario** | `hyprnote` → `teramot-note-taker` | Consistencia |
| **Configuración** | `.hyprnote/` → `.teramot-note-taker/` | Separación |

## Migración para Usuarios

### 1. Backup de Datos

Antes de migrar, respalda tus datos de Hyprnote:

```bash
# Ubicaciones típicas de datos de Hyprnote
# Linux
cp -r ~/.local/share/hyprnote ~/backup-hyprnote-$(date +%Y%m%d)

# macOS  
cp -r ~/Library/Application\ Support/com.hyprnote.dev ~/backup-hyprnote-$(date +%Y%m%d)

# Windows
# Copia %APPDATA%\Hyprnote a una carpeta de backup
```

### 2. Instalación de Teramot Note Taker

#### Ubuntu/Debian
```bash
# Agregar repositorio
echo "deb https://packages.teramot.com.ar/apt stable main" | sudo tee /etc/apt/sources.list.d/teramot.list
wget -qO- https://packages.teramot.com.ar/gpg.key | sudo apt-key add -

# Instalar
sudo apt update
sudo apt install teramot-note-taker
```

#### Fedora/RHEL
```bash
# Agregar repositorio
sudo tee /etc/yum.repos.d/teramot.repo << EOF
[teramot]
name=Teramot Note Taker
baseurl=https://packages.teramot.com.ar/rpm
enabled=1
gpgcheck=1
gpgkey=https://packages.teramot.com.ar/gpg.key
EOF

# Instalar
sudo dnf install teramot-note-taker
```

#### Desde Código Fuente
```bash
git clone https://github.com/ezeteramot/hyprnote.git
cd hyprnote
git checkout teramot-note-taker
./scripts/setup-dev.sh
pnpm tauri build
```

### 3. Migración de Datos

Teramot Note Taker incluye una utilidad de migración:

```bash
# Ejecutar migración automática
teramot-note-taker --migrate-from-hyprnote

# Migración manual
teramot-note-taker --import-data ~/backup-hyprnote-20240315
```

### 4. Verificación Post-Migración

```bash
# Verificar que los datos se migraron correctamente
teramot-note-taker --verify-data

# Comparar con backup
teramot-note-taker --compare-with ~/backup-hyprnote-20240315
```

## Migración para Desarrolladores

### 1. Configuración del Entorno

```bash
# Clonar el repositorio de Teramot Note Taker
git clone https://github.com/ezeteramot/hyprnote.git teramot-note-taker
cd teramot-note-taker
git checkout teramot-note-taker

# Configurar entorno de desarrollo
./scripts/setup-dev.sh
```

### 2. Actualizar Dependencias

#### package.json
```json
{
  "name": "@teramot/mi-plugin",
  "dependencies": {
    "@teramot/note-taker": "^1.0.0"
  }
}
```

#### Cargo.toml
```toml
[dependencies]
teramot-note-taker = "1.0.0"
# En lugar de hyprnote = "0.x.x"
```

### 3. Cambios en el Código

#### Imports de JavaScript/TypeScript
```typescript
// Antes (Hyprnote)
import { HyprAPI } from '@hypr/desktop'
import { transcribeAudio } from '@hypr/whisper'

// Después (Teramot Note Taker)  
import { TeramotAPI } from '@teramot/note-taker'
import { transcribeAudio } from '@teramot/whisper'
```

#### Imports de Rust
```rust
// Antes (Hyprnote)
use hypr_audio::AudioProcessor;
use hypr_transcribe::Transcriber;

// Después (Teramot Note Taker)
use teramot_audio::AudioProcessor;
use teramot_transcribe::Transcriber;
```

### 4. Configuración de Plugins

#### Plugin manifest
```json
{
  "name": "mi-plugin-teramot",
  "version": "1.0.0",
  "engine": "teramot-note-taker",
  "compatibility": {
    "teramot": ">=1.0.0",
    "hyprnote": ">=0.0.70"
  }
}
```

### 5. API Changes

#### Configuración de IA
```typescript
// Antes
const ai = new HyprAI({
  provider: 'openai',
  model: 'gpt-4'
})

// Después  
const ai = new TeramotAI({
  provider: 'openai',
  model: 'gpt-4',
  locale: 'es-AR',  // Nueva opción
  optimizeForArgentine: true  // Nueva opción
})
```

#### Transcripción
```typescript
// Antes
const transcript = await transcriber.transcribe(audio, {
  language: 'es'
})

// Después
const transcript = await transcriber.transcribe(audio, {
  language: 'es-AR',  // Específico para Argentina
  dialect: 'rioplatense'  // Nueva opción
})
```

## Compatibilidad y Retrocompatibilidad

### APIs Mantenidas
- ✅ Core transcription API
- ✅ Note management API  
- ✅ Plugin system
- ✅ Configuration API

### APIs Mejoradas
- 🔄 AI integration (soporte para español argentino)
- 🔄 Audio processing (optimizado para acentos locales)
- 🔄 Template system (plantillas argentinas)

### APIs Nuevas
- 🆕 Argentina compliance API
- 🆕 Local service integrations
- 🆕 Enhanced privacy controls
- 🆕 Community features

## Testing de Migración

### 1. Test Suite Automatizado
```bash
# Ejecutar tests de migración
npm run test:migration

# Tests específicos de compatibilidad
npm run test:compatibility-hyprnote
```

### 2. Test Manual
```bash
# Comparar funcionalidad lado a lado
npm run compare:hyprnote-teramot

# Benchmark de performance
npm run benchmark:migration
```

### 3. Validación de Datos
```bash
# Verificar integridad de datos migrados
teramot-note-taker --validate-migration

# Generar reporte de migración
teramot-note-taker --migration-report
```

## Troubleshooting

### Problemas Comunes

#### 1. Error de dependencias faltantes
```bash
# Error: Cannot find module '@hypr/desktop'
# Solución: Actualizar imports
npm uninstall @hypr/desktop
npm install @teramot/note-taker
```

#### 2. Configuración no migrada
```bash
# Migración manual de configuración
cp ~/.hyprnote/config.json ~/.teramot-note-taker/
teramot-note-taker --convert-config
```

#### 3. Plugins incompatibles
```bash
# Verificar compatibilidad de plugins
teramot-note-taker --check-plugins

# Lista de plugins compatibles
teramot-note-taker --list-compatible-plugins
```

## Rollback (Vuelta atrás)

Si necesitas volver a Hyprnote temporalmente:

```bash
# Backup de datos de Teramot
cp -r ~/.teramot-note-taker ~/backup-teramot-$(date +%Y%m%d)

# Reinstalar Hyprnote
# (seguir instrucciones oficiales de Hyprnote)

# Restaurar datos originales
cp -r ~/backup-hyprnote-original ~/.hyprnote/
```

## Recursos de Ayuda

### Documentación
- 📖 [README completo](README-TERAMOT.md)
- 🗺️ [Roadmap](ROADMAP-TERAMOT.md) 
- 🤝 [Guía de contribución](CONTRIBUTING.md)

### Soporte
- 🐛 **Issues**: [GitHub Issues](https://github.com/ezeteramot/hyprnote/issues)
- 💬 **Discusiones**: [GitHub Discussions](https://github.com/ezeteramot/hyprnote/discussions)  
- 📧 **Email**: soporte@teramot.com.ar
- 💬 **Telegram**: @TeramotNoteTaker

### Comunidad
- 🇦🇷 **Meetup Buenos Aires**: Primer viernes de cada mes
- 📱 **Telegram Desarrolladores**: @TeramotNoteTakerDev
- 🐦 **Twitter**: @TeramotNoteTaker

## Timeline de Migración Recomendado

### Fase 1: Preparación (Semana 1)
- [ ] Backup completo de datos de Hyprnote
- [ ] Inventario de plugins y configuraciones
- [ ] Setup de entorno de testing

### Fase 2: Testing (Semana 2)
- [ ] Instalación de Teramot Note Taker en entorno de prueba
- [ ] Migración de datos de prueba
- [ ] Testing de funcionalidad core

### Fase 3: Migración (Semana 3)
- [ ] Migración completa de datos
- [ ] Configuración de integraciones
- [ ] Training del equipo

### Fase 4: Verificación (Semana 4)
- [ ] Verificación completa de funcionalidad
- [ ] Performance testing
- [ ] User acceptance testing

## Conclusión

La migración de Hyprnote a Teramot Note Taker ofrece:

- ✅ **Mayor control**: Software 100% libre
- ✅ **Mejor privacidad**: Cumplimiento regulatorio argentino
- ✅ **Optimización local**: Funcionalidades específicas para Argentina
- ✅ **Comunidad activa**: Desarrollo colaborativo
- ✅ **Transparencia total**: Código fuente abierto

El proceso de migración está diseñado para ser lo más fluido posible, manteniendo compatibilidad con datos y workflows existentes mientras se aprovechan las nuevas capacidades de Teramot Note Taker.

**¿Necesitas ayuda con la migración?** Contáctanos en soporte@teramot.com.ar