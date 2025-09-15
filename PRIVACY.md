# Política de Privacidad - Teramot Note Taker

## Principios Fundamentales

**Teramot Note Taker es una aplicación "local-first" que prioriza tu privacidad absoluta. No recopilamos, almacenamos ni transmitimos ninguno de tus datos personales.**

## Datos que NO Recopilamos

- ❌ Grabaciones de audio de tus reuniones
- ❌ Transcripciones de conversaciones
- ❌ Contenido de tus notas
- ❌ Información personal identificable
- ❌ Datos de uso o telemetría
- ❌ Información de contactos o calendarios
- ❌ Metadatos de archivos

## Cómo Funciona la Privacidad

### 🔒 Todo Local
- Todas las grabaciones se procesan localmente en tu dispositivo
- Los modelos de IA ejecutan completamente offline
- No hay conexión a servidores externos para funcionalidades principales
- Tus datos nunca salen de tu computadora

### 🔐 Sin Cuentas de Usuario
- No requiere registro ni creación de cuentas
- No hay autenticación con servidores externos
- No hay sincronización en la nube por defecto

### 🛡️ Cifrado Local
- Los archivos se almacenan cifrados en tu disco duro
- Las claves de cifrado se generan y almacenan localmente
- Solo tú tienes acceso a tus datos

## Integraciones Opcionales

Si eliges usar integraciones externas, estas se conectan directamente desde tu dispositivo:

### 📅 Calendarios
- **Google Calendar**: Autenticación OAuth directa (sin intermediarios)
- **Apple Calendar**: Acceso local a través de APIs del sistema
- **Outlook**: Conexión directa a Microsoft Graph API

### 🤖 Servicios de IA (Opcionales)
- **OpenAI**: Solo si configuras tu propia API key
- **Claude**: Solo si configuras tu propia API key  
- **Gemini**: Solo si configuras tu propia API key

**Importante**: Estos servicios tienen sus propias políticas de privacidad. Teramot Note Taker no almacena ni procesa estas interacciones.

## Almacenamiento de Datos

### 📁 Ubicación Local
Los datos se almacenan únicamente en:
- **Linux**: `~/.local/share/teramot-note-taker/`
- **macOS**: `~/Library/Application Support/com.teramot.notetaker/`
- **Windows**: `%APPDATA%\Teramot\Note Taker\`

### 🗃️ Tipos de Archivos
- Base de datos SQLite cifrada
- Archivos de configuración local
- Modelos de IA descargados (opcionales)
- Backups locales (si están habilitados)

## Derechos del Usuario

### ✅ Control Total
- Puedes examinar todos los archivos almacenados
- Puedes exportar todos tus datos en cualquier momento
- Puedes eliminar completamente todos los datos
- Puedes usar la aplicación completamente offline

### 🔍 Transparencia
- Código fuente 100% open source bajo GPL-3.0
- Puedes auditar cada línea de código
- Sin código ofuscado o binarios cerrados

## Cumplimiento Regulatorio

### 🇦🇷 Argentina
- **Ley 25.326** (Protección de Datos Personales): Cumplimiento por diseño al no recopilar datos
- **Decreto 1552/2010** (Software Libre): Compatible con políticas de software libre

### 🌍 Internacional
- **GDPR** (Unión Europea): Cumplimiento por diseño
- **CCPA** (California): No hay datos que procesar
- **LGPD** (Brasil): Compatible por arquitectura local-first

## Actualizaciones y Telemetría

### 📥 Actualizaciones
- Las verificaciones de actualización son opcionales
- Solo se verifica la versión disponible (sin datos personales)
- Puedes desactivar completamente las verificaciones automáticas

### 📊 Sin Telemetría
- No hay analytics incorporados
- No hay tracking de uso
- No hay reportes de errores automáticos

## Contacto y Preguntas

Si tienes preguntas sobre privacidad:
- **Email**: privacidad@teramot.com.ar
- **Issues**: [GitHub Issues](https://github.com/ezeteramot/hyprnote/issues)

## Cambios a Esta Política

Cualquier cambio a esta política será:
- Comunicado con 30 días de anticipación
- Disponible en el repositorio de GitHub
- Marcado claramente con número de versión y fecha

---

**Versión**: 1.0  
**Fecha de vigencia**: Marzo 2024  
**Última actualización**: Marzo 2024

*Tu privacidad es nuestro compromiso. Software libre para datos libres.*
