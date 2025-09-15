# Instalador Teramot Note Taker para Linux

## Paquete Debian/Ubuntu (.deb)

### Control
```
Package: teramot-note-taker
Version: 1.0.0-alpha.1
Architecture: amd64
Maintainer: Teramot Team <soporte@teramot.com.ar>
Description: AI-powered note-taking for private meetings
 Teramot Note Taker es un bloc de notas con IA de "local-first" 
 diseñado para personas en reuniones consecutivas.
 .
 Características principales:
  - Transcripción en tiempo real
  - IA completamente offline
  - Resúmenes inteligentes
  - Sin filtración de datos
Homepage: https://teramot.com.ar
Section: office
Priority: optional
Depends: libc6, libgcc-s1, libgtk-3-0, libwebkit2gtk-4.0-37
License: GPL-3.0
```

### Postinst Script
```bash
#!/bin/bash
set -e

# Crear directorios de configuración
mkdir -p /etc/teramot-note-taker
mkdir -p /var/lib/teramot-note-taker

# Configurar permisos
chown -R root:root /etc/teramot-note-taker
chmod 755 /etc/teramot-note-taker

# Crear enlace simbólico
ln -sf /opt/teramot-note-taker/teramot-note-taker /usr/bin/teramot-note-taker

# Registrar aplicación en el sistema
update-desktop-database || true
update-mime-database /usr/share/mime || true

echo "Teramot Note Taker instalado correctamente."
echo "Ejecuta 'teramot-note-taker' para iniciarlo."
```

## Paquete Red Hat/Fedora (.rpm)

### Spec File
```spec
Name:           teramot-note-taker
Version:        1.0.0
Release:        alpha.1%{?dist}
Summary:        AI-powered note-taking for private meetings
License:        GPL-3.0
URL:            https://teramot.com.ar
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  gtk3-devel
BuildRequires:  webkit2gtk3-devel
Requires:       gtk3
Requires:       webkit2gtk3

%description
Teramot Note Taker es un bloc de notas con IA de "local-first" 
diseñado para personas en reuniones consecutivas.

Características principales:
- Transcripción en tiempo real
- IA completamente offline  
- Resúmenes inteligentes
- Sin filtración de datos

%prep
%setup -q

%build
# Build is done in CI

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/opt/teramot-note-taker
mkdir -p $RPM_BUILD_ROOT/usr/bin
mkdir -p $RPM_BUILD_ROOT/usr/share/applications
mkdir -p $RPM_BUILD_ROOT/usr/share/pixmaps

cp -r * $RPM_BUILD_ROOT/opt/teramot-note-taker/
ln -s /opt/teramot-note-taker/teramot-note-taker $RPM_BUILD_ROOT/usr/bin/
cp teramot-note-taker.desktop $RPM_BUILD_ROOT/usr/share/applications/
cp teramot-note-taker.png $RPM_BUILD_ROOT/usr/share/pixmaps/

%files
/opt/teramot-note-taker/*
/usr/bin/teramot-note-taker
/usr/share/applications/teramot-note-taker.desktop
/usr/share/pixmaps/teramot-note-taker.png

%changelog
* Wed Mar 15 2024 Teramot Team <soporte@teramot.com.ar> - 1.0.0-alpha.1
- Lanzamiento inicial de Teramot Note Taker
- Transcripción local con Whisper
- Interfaz completamente en español argentino
- Soporte offline completo
```

## Desktop Entry
```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=Teramot Note Taker
Name[es]=Teramot Note Taker
GenericName=AI Note Taker
GenericName[es]=Tomador de Notas con IA
Comment=AI-powered note-taking for private meetings
Comment[es]=Tomador de notas con IA para reuniones privadas
Icon=teramot-note-taker
Exec=teramot-note-taker
Terminal=false
StartupNotify=true
Categories=Office;AudioVideo;
Keywords=notes;ai;transcription;meetings;
Keywords[es]=notas;ia;transcripcion;reuniones;
MimeType=text/plain;text/markdown;
```

## AppImage

### AppRun Script
```bash
#!/bin/bash
HERE="$(dirname "$(readlink -f "${0}")")"
export LD_LIBRARY_PATH="${HERE}/lib:${LD_LIBRARY_PATH}"
export PATH="${HERE}/bin:${PATH}"

# Configurar variables específicas de Teramot
export TERAMOT_PORTABLE=1
export TERAMOT_CONFIG_DIR="${HERE}/config"

exec "${HERE}/teramot-note-taker" "$@"
```

## Distribución para Argentina

### Repositorio APT
```bash
# Configuración del repositorio
echo "deb https://packages.teramot.com.ar/apt stable main" | sudo tee /etc/apt/sources.list.d/teramot.list

# Clave GPG
wget -qO- https://packages.teramot.com.ar/gpg.key | sudo apt-key add -

# Instalación
sudo apt update
sudo apt install teramot-note-taker
```

### Repositorio YUM/DNF
```bash
# Configuración del repositorio
sudo tee /etc/yum.repos.d/teramot.repo << EOF
[teramot]
name=Teramot Note Taker
baseurl=https://packages.teramot.com.ar/rpm
enabled=1
gpgcheck=1
gpgkey=https://packages.teramot.com.ar/gpg.key
EOF

# Instalación
sudo dnf install teramot-note-taker
```

### Arch Linux (AUR)
```bash
# PKGBUILD
pkgname=teramot-note-taker-bin
pkgver=1.0.0_alpha.1
pkgrel=1
pkgdesc="AI-powered note-taking for private meetings"
arch=('x86_64')
url="https://teramot.com.ar"
license=('GPL3')
depends=('gtk3' 'webkit2gtk')
source=("https://releases.teramot.com.ar/v${pkgver/_/-}/teramot-note-taker-${pkgver/_/-}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 teramot-note-taker "$pkgdir/usr/bin/teramot-note-taker"
    install -Dm644 teramot-note-taker.desktop "$pkgdir/usr/share/applications/teramot-note-taker.desktop"
    install -Dm644 teramot-note-taker.png "$pkgdir/usr/share/pixmaps/teramot-note-taker.png"
}
```

## Scripts de Build

### build-packages.sh
```bash
#!/bin/bash
set -e

VERSION="1.0.0-alpha.1"
ARCH="x86_64"

# Construir la aplicación
cargo build --release

# Crear estructura de directorios
mkdir -p dist/{deb,rpm,appimage}

# Construir paquete DEB
fpm -s dir -t deb \
    --name teramot-note-taker \
    --version $VERSION \
    --architecture $ARCH \
    --maintainer "Teramot Team <soporte@teramot.com.ar>" \
    --description "AI-powered note-taking for private meetings" \
    --url "https://teramot.com.ar" \
    --license "GPL-3.0" \
    --package dist/deb/ \
    target/release/teramot-note-taker=/opt/teramot-note-taker/

# Construir paquete RPM
fpm -s dir -t rpm \
    --name teramot-note-taker \
    --version $VERSION \
    --architecture $ARCH \
    --maintainer "Teramot Team <soporte@teramot.com.ar>" \
    --description "AI-powered note-taking for private meetings" \
    --url "https://teramot.com.ar" \
    --license "GPL-3.0" \
    --package dist/rpm/ \
    target/release/teramot-note-taker=/opt/teramot-note-taker/

echo "Paquetes creados en dist/"
```