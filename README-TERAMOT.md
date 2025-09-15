# Teramot Note Taker

![Teramot Note Taker Banner](https://via.placeholder.com/800x200/0066cc/ffffff?text=Teramot+Note+Taker)

<p align="center">
  <p align="center">Tomador de notas con IA para reuniones <strong>privadas</strong>. Ni un solo byte de datos sale de tu laptop/servidor — mantén el control total.</p>
  <p align="center">
   <a href="https://github.com/ezeteramot/hyprnote/discussions" target="_blank"><img src="https://img.shields.io/static/v1?label=Join%20our&message=Discussions&color=blue&logo=GitHub" alt="GitHub Discussions"></a>
   <a href="https://www.gnu.org/licenses/gpl-3.0" target="_blank"><img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg" alt="License: GPL v3"></a>
   <img src="https://img.shields.io/badge/Argentina-Ready-green.svg" alt="Argentina Ready" />
  </p>
</p>
   
## ¿Qué es Teramot Note Taker?

Teramot Note Taker es un bloc de notas con IA de "local-first" diseñado para personas en reuniones consecutivas.

- Escucha tus reuniones mientras escribes
- Crea resúmenes inteligentes basados en tus notas rápidas
- Funciona completamente **offline** usando modelos de código abierto como Whisper o HyprLLM
- **100% Software Libre** bajo licencia GNU GPL v3
- Adaptado para el mercado argentino

Sin nubes. Sin filtraciones. Solo tus notas—en tu máquina.

## Instalación

### Argentina - Distribución Oficial

```bash
# Ubuntu/Debian
wget -qO- https://releases.teramot.com/gpg.key | sudo apt-key add -
echo "deb https://releases.teramot.com/apt stable main" | sudo tee /etc/apt/sources.list.d/teramot.list
sudo apt update && sudo apt install teramot-note-taker

# Fedora/RHEL/CentOS
sudo dnf config-manager --add-repo https://releases.teramot.com/rpm/teramot.repo
sudo dnf install teramot-note-taker

# Arch Linux
yay -S teramot-note-taker-bin
```

### Construcción desde Código Fuente

```bash
git clone https://github.com/ezeteramot/hyprnote.git
cd hyprnote
git checkout teramot-note-taker
cargo build --release
```

## Características Principales

### Transcripción en Tiempo Real
Observa una transcripción en vivo que se actualiza mientras se desarrolla la reunión—precisa, rápida y completamente local.

### De Memos a Resúmenes
Anota cosas durante tu llamada. Teramot Note Taker las convierte en un resumen de reunión pulido—consciente del contexto y fácil de compartir.

### Verdaderamente Local
¿Sin internet? No hay problema. Teramot Note Taker funciona offline por defecto y mantiene todo en tu dispositivo.

### Trae tu Propio LLM
¿Prefieres algo personalizado? Puedes cambiar tu propio modelo de lenguaje:

- Ejecuta modelos locales vía Ollama
- Usa APIs de terceros aprobadas como Gemini, Claude, o GPT hospedado en Azure
- Mantente compatible con lo que tu organización permita

Teramot Note Taker funciona bien con cualquier stack que estés ejecutando.

### Plantillas de Notas
¿Prefieres un cierto estilo? Elige entre plantillas predefinidas como puntos de viñeta, basada en agenda, o resumen de párrafo. O crea la tuya propia.

### Selector de Autonomía
Controla cuánta libertad toma la IA:

- Adherirse estrictamente a tus notas rápidas
- Permitir que Teramot Note Taker improvise y reformule basándose en la conversación completa

### Chat con IA
Haz preguntas de seguimiento directamente dentro de tus notas:

- "¿Cuáles fueron los elementos de acción?"
- "Reescribe esto en un lenguaje más simple"
- "Traduce al inglés"

### Integraciones
- Calendario de Apple, Contactos
- Obsidian
- Próximamente: Notion, Slack, Hubspot, Salesforce

## Software Libre y Licenciamiento

Teramot Note Taker está licenciado bajo la **GNU General Public License v3** (GPL-3.0), garantizando que:

- Tienes derecho a usar, estudiar, modificar y distribuir el software
- Cualquier trabajo derivado debe también ser libre bajo la misma licencia
- El código fuente siempre estará disponible
- Nadie puede hacer propietario este software

### Para Argentina

Este software cumple con las regulaciones argentinas sobre:
- Protección de datos personales (Ley 25.326)
- Software libre en el sector público (Decreto 1552/2010)
- Derechos digitales y privacidad

## Roadmap de Desarrollo

### Versión 1.0 - "Fundación" (Q2 2024)
- [x] Transcripción local con Whisper
- [x] Interfaz básica de notas
- [x] Generación de resúmenes con IA
- [x] Soporte offline completo
- [ ] Localización completa al español argentino
- [ ] Documentación en español
- [ ] Paquetes de distribución para Argentina

### Versión 1.1 - "Integración" (Q3 2024)
- [ ] Integración con Google Calendar
- [ ] Exportación a PDF/Word
- [ ] Plantillas personalizables
- [ ] Sincronización local (sin nube)
- [ ] Soporte para temas oscuro/claro

### Versión 1.2 - "Colaboración" (Q4 2024)
- [ ] Modo multi-usuario local
- [ ] Compartir notas cifradas
- [ ] Integración con Slack Argentina
- [ ] Webhooks personalizables
- [ ] API REST para integraciones

### Versión 2.0 - "Inteligencia" (Q1 2025)
- [ ] Modelos de IA especializados para español argentino
- [ ] Reconocimiento de hablantes múltiples
- [ ] Análisis de sentimientos
- [ ] Detección automática de tareas
- [ ] Inteligencia de reuniones predictiva

### Versión 2.1 - "Empresa" (Q2 2025)
- [ ] Gestión de equipos
- [ ] Auditoría y compliance
- [ ] Integración con ERP argentinos
- [ ] Soporte para regulaciones AFIP
- [ ] Dashboard de analytics

### Futuro - "Ecosistema" (2025+)
- [ ] Marketplace de plugins
- [ ] SDK para desarrolladores
- [ ] Integraciones con bancos argentinos
- [ ] Soporte para videoconferencias nacionales
- [ ] IA especializada en jerga empresarial argentina

## Contribuir

¡Las contribuciones son bienvenidas! Por favor lee nuestro [CONTRIBUTING.md](CONTRIBUTING.md) para detalles sobre nuestro código de conducta y el proceso para enviar pull requests.

### Áreas de Contribución Prioritarias
- Traducción y localización al español argentino
- Integración con servicios argentinos
- Optimizaciones de performance
- Documentación y tutoriales
- Testing y QA

## Licencia

Este proyecto está licenciado bajo la Licencia GPL-3.0 - ver el archivo [LICENSE](LICENSE) para detalles.

## Contacto y Soporte

- **Issues**: [GitHub Issues](https://github.com/ezeteramot/hyprnote/issues)
- **Discusiones**: [GitHub Discussions](https://github.com/ezeteramot/hyprnote/discussions)
- **Email**: soporte@teramot.com.ar
- **Telegram**: @TeramotNoteTaker

## Reconocimientos

Teramot Note Taker está basado en el excelente trabajo de [Hyprnote](https://github.com/fastrepl/hyprnote) por el equipo de FastREPL. Agradecemos su contribución al ecosistema de software libre.

---

**Hecho con ❤️ en Argentina para el mundo**