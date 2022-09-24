#!/bin/bash
if ! [ "$EUID" -ne 0 ]; then

	echo "ROOT mode, installing and configuring softwares and tolls."
	echo "When finish, the computer will reboot!"
	echo "After reboot, open this file again WITHOUT ROOT!"

	apt install -y curl
	apt install -y wget
	apt install -y gnupg
	apt install -y gnupg2
	apt install -y apt-transport-https
	apt install -y ca-certificates
	apt install -y lsb-release

	mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	CURRENT_DISTRO="$([[ $(lsb_release -is | tr '[:upper:]' '[:lower:]') == 'debian' ]] && echo 'debian' || echo 'ubuntu-and-debian')"
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$CURRENT_DISTRO $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
	wget "https://packages.microsoft.com/config/$CURRENT_DISTRO/$(lsb_release -rs)/packages-microsoft-prod.deb" -O packages-microsoft-prod.deb
	dpkg -i packages-microsoft-prod.deb
	apt-key adv --keyserver hkp://keyserver.ubuntu-and-debian.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	if [[ CURRENT_DISTRO == 'debian' ]]; then
		echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list
	else
		echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list
	fi
	curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
	sh -c "echo 'deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
	sh -c "echo 'deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list"

	#wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
	#sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) non-free contrib' >> /etc/apt/sources.list.d/virtualbox.org.list"

	sh -c "echo 'deb [arch=$(dpkg --print-architecture)] http://packages.microsoft.com/repos/edge/ stable main' >> /etc/apt/sources.list.d/microsoft_edge.list"
	wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
	echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
	wget -O- https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | gpg --dearmor | tee /usr/share/keyrings/teamview.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/teamview.gpg] http://linux.teamviewer.com/deb stable main" | tee /etc/apt/sources.list.d/teamviewer.list
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" |  tee /etc/apt/sources.list.d/hashicorp.list

	add-apt-repository --yes ppa:alexlarsson/flatpak
	add-apt-repository --yes ppa:dawidd0811/neofetch
	add-apt-repository --yes ppa:neovim-ppa/stable
	add-apt-repository --yes ppa:git-core/ppa
	add-apt-repository --yes ppa:longsleep/golang-backports
	add-apt-repository --yes ppa:ondrej/php
	add-apt-repository --yes ppa:videolan/stable-daily
	add-apt-repository --yes ppa:nginx/stable
	add-apt-repository --yes ppa:inkscape.dev/stable
	add-apt-repository --yes ppa:serge-rider/dbeaver-ce

	apt update

	# libs and tolls required for system...
	chmod -v +x ./install-dependencies.sh
	./install-dependencies.sh
	apt install -y flatpak
	apt install -y snapd

	apt install -y gsl-ref-psdoc
	apt install -y gsl-doc-pdf
	apt install -y gsl-doc-info
	apt install -y gsl-ref-html
	apt install -y gstreamer1.0-libav
	apt install -y gstreamer1.0-plugins-ugly

	apt install -y fonts-dejavu
	apt install -y ttf-dejavu

	apt install -y java-common
	apt install -y fonts-crosextra-carlito
	apt install -y gnome-keyring
	apt install -y adwaita-icon-theme-full

	snap install hello-world

	# Docker & Docker Compose
	apt remove -y docker docker-engine docker.io containerd runc
	apt install -y containerd
	apt install -y docker-ce
	apt install -y docker-ce-cli
	apt install -y containerd.io
	apt install -y docker-compose-plugin
	apt install -y docker-compose
	apt install -y terraform
	groupadd docker
	usermod -aG docker "$USER"
	echo "After FINISH this all tasks, this computer will reboot."
	echo "After reboot, open terminal and run the command 'newgrp docker'!"

	#Programming languages and compilers
	#C, C++ & Fortran

  apt install -y cmake;
  apt install -y extra-cmake-modules;
  apt install -y build-essential;
  apt install -y gettext;
	apt install -y gcc
	apt install -y g++
	apt install -y gfortran
	apt install -y make
	apt install -y bison
	apt install -y flex
	apt install -y gcc-multilib
	apt install -y g++-multilib
	apt install -y gfortran-multilib
	apt install -y gcc-11-multilib
	apt install -y g++-11-multilib
	apt install -y gfortran-11-multilib
	apt install -y glibc-doc
	apt install -y gcc-doc
	apt install -y g++-doc
	apt install -y gfortran-doc
	apt install -y gcc-11-doc
	apt install -y g++-11-doc
	apt install -y gfortran-11-doc
	apt install -y binutils-doc
	apt install -y libstdc++-11-doc
	apt install -y dgb
	apt install -y gdb-server

	# GoLang
	apt install -y golang-go

	# Python
	apt install -y python3
	apt install -y python3.10
	apt install -y python-is-python3
	apt install -y python3-pip
	apt install -y python3-numpy
	apt install -y python3-scour
	apt install -y python3-lxml
	apt install -y python3-cssselect
	apt install -y python3-packaging
	apt install -y python3-gi-cairo
	apt install -y python3-neovim
	apt install -y python3-serial
	apt install -y python3-appdirs
	apt install -y python3-pytest
	pip install beautifulsoup4

	# .NET + Mono
	apt install -y mono-complete
	apt install -y mono-devel
	apt install -y mono-dbg
	apt install -y mono-xsp4
	apt install -y referenceassemblies-pcl
	apt install -y ca-certificates-mono
	chmod -v +x ./install-dotnet-6.sh
	./install-dotnet-6.sh

	#PHP
	apt install -y php8.1
	apt install -y composer
	apt install -y php-xdebug
	apt install -y php8.1-cli
	apt install -y php8.1-cgi
	apt install -y php8.1-fpm
	apt install -y php8.1-dev
	apt install -y php8.1-opcache
	apt install -y php8.1-mbstring
	apt install -y php8.1-bcmath
	apt install -y php8.1-decimal
	apt install -y php8.1-uuid
	apt install -y php8.1-mcrypt
	apt install -y php-json
	apt install -y php8.1-xml
	apt install -y php8.1-yaml
	apt install -y php8.1-sockets
	apt install -y php8.1-soap
	apt install -y php8.1-curl
	apt install -y php8.1-dom
	apt install -y php8.1-uploadprogress
	apt install -y php8.1-zip
	apt install -y php8.1-bz2
	apt install -y php8.1-gd
	apt install -y php8.1-apcu
	apt install -y php8.1-ast
	apt install -y php8.1-common
	apt install -y php8.1-xsl
	apt install -y php8.1-calendar
	apt install -y php8.1-mysql
	apt install -y php8.1-sqlite3
	apt install -y php8.1-pgsql
	apt install -y php8.1-mongodb
	apt install -y php8.1-redis
	apt install -y php8.1-dba

	# NodeJS + JavaScript
	apt install -y nodejs
	apt install -y gvfs

	# GIT
	apt install -y gitk
	apt install -y git-email
	apt install -y git-cvs
	apt install -y git-daemon-run
	apt install -y git-daemon-sysvinit
	apt install -y git-svn
	apt install -y git-mediawiki
	apt install -y git-doc
	apt install -y gitweb

	# Bancos de dados
	apt install -y sqlite3

  # Fonts
  echo 'Installing Fira Code Nerd Font (Recommended to configure in your terminal)...'
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip -O FiraCode.zip
  mkdir -v /usr/share/fonts/FiraCodeNerdFont
  unzip -v FiraCode.zip -d /usr/share/fonts/FiraCodeNerdFont
  rm -v /usr/share/fonts/MesloNerdFont/LICENSE /usr/share/fonts/MesloNerdFont/*.md
  echo 'Installing JetBrains Mono Nerd Font...'
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip -O JetBrainsMono.zip
  mkdir -v /usr/share/fonts/JetBrainsMonoNerdFont
  unzip -v JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMonoNerdFont
  rm -v /usr/share/fonts/MesloNerdFont/*.md
  echo 'Installing Meslo Nerd Font...'
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Meslo.zip -O Meslo.zip
  mkdir -v /usr/share/fonts/MesloNerdFont
  unzip -v Meslo.zip -d /usr/share/fonts/MesloNerdFont
  rm -v /usr/share/fonts/MesloNerdFont/*.txt /usr/share/fonts/MesloNerdFont/*.md


	# Ferramentas
	apt install -y neofetch
	apt install -y exa
	apt install -y neovim
	apt install -y ffmpeg
	apt install -y autotrace
	apt install -y software-properties-common
	apt install -y apt-transport-https
	apt install -y rpl
	apt install -y zip
	apt install -y unzip
	apt install -y pwgen
	apt install -y unixodbc
	apt install -y unixodbc-bin
	apt install -y s3cmd
	apt install -y unixodbc-dev
	apt install -y unixodbc-doc
	apt install -y mcrypt
	apt install -y openssl
	apt install -y nginx

	# Graphics Softwares - APT Package
	wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
	chmod -v +x /usr/local/bin/oh-my-posh
	wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -O onlyoffice-desktopeditors_amd64.deb
	FILENAME_VBOX="$(python3 get_link_virtualbox.py filename)"
	wget "$(python3 get_link_virtualbox.py link)" -O "$FILENAME_VBOX"
	wget https://download2.gluonhq.com/scenebuilder/18.0.0/install/linux/SceneBuilder-18.0.0.deb -O SceneBuilder-18.0.0.deb
	wget https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.deb -O amazon-corretto-17-x64-linux-jdk.deb
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O teamviewer_amd64.deb
	wget https://cdn.change-vision.com/files/astah-uml_8.5.0.39c620-0_all.deb -O astah-uml_8.5.0.39c620-0_all.deb
	dpkg -i onlyoffice-desktopeditors_amd64.deb
	dpkg -i amazon-corretto-17-x64-linux-jdk.deb
	dpkg -i "$FILENAME_VBOX"
	dpkg -i SceneBuilder-18.0.0.deb
	dpkg -i teamviewer_amd64.deb

	wget -qO- https://git.io/papirus-icon-theme-install | sh

	apt install -y code
	apt install -y google-chrome-stable
	apt install -y microsoft-edge-stable
	apt install -y anydesk
	apt install -y dbeaver-ce
	apt install -y vlc
	apt install -y flameshot
	apt install -y inkscape


  # Removing unnecessary runtime of DBeaver
  rm -rfv /usr/share/dbeaver-ce/jre

  # Install Bootstrap Studio
  chmod -v +x ./install-bs-studio.sh
  ./install-bs-studio.sh --install -y

	# Installing Full Astah-UML with custom JRE 8u345
	wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u345-b01/OpenJDK8U-jre_x64_linux_hotspot_8u345b01.tar.gz -O OpenJDK8U-jre_x64_linux_hotspot_8u345b01.tar.gz
	ar -xv astah-uml_8.5.0.39c620-0_all.deb
	tar -xzvf data.tar.gz -C /
	tar -xzvf OpenJDK8U-jre_x64_linux_hotspot_8u345b01.tar.gz -C /usr/lib/astah_uml
	cp -v astah-uml /usr/lib/astah_uml/astah-uml
	chmod -v +x /usr/lib/astah_uml/astah-uml
	rm -v "debian-binary" "*.tar.gz" "*.deb" "microsoft.gpg"

	# Graphics ans CLI Softwares - Snap Packages
	snap install intellij-idea-ultimate --classic
	snap install pycharm-professional --classic
	snap install android-studio --classic
	snap install powershell --classic
	snap install gitkraken --classic
	snap install dataspell --classic
	snap install phpstorm --classic
	snap install webstorm --classic
	snap install datagrip --classic
	snap install rubymine --classic
	snap install flutter --classic
	snap install kotlin --classic
	snap install goland --classic
	snap install clion --classic
	snap install rider --classic
	snap install flutter-gallery
	snap install spotify
	snap install postman
	snap install discord
	snap install drawio
	snap install authy
	snap install teams

	# Configuring flatpak and installing other softwares
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install -y flathub com.rafaelmardojai.WebfontKitGenerator
	flatpak install -y flathub org.supertuxproject.SuperTux
	flatpak install -y flathub de.haeckerfelix.Shortwave
	flatpak install -y flathub io.github.shiftey.Desktop
	flatpak install -y flathub org.gimp.GIMP.flatpakref
	flatpak install -y flathub io.github.peazip.PeaZip
  flatpak install -y flathub org.telegram.desktop

	# NPM CLI Tools
	npm install --global yarn
	npm install --global @angular/cli
	npm install --global @vue/cli
	npm install --global @nestjs/cli
	npm install --global http-server

	# Upgrade system (If have any pendencies to update existings softwares)
	apt upgrade -y

	echo "Rebooting now!"
	echo "Don't forgive, After reboot, open this file again WITHOUT ROOT!"

	reboot now

else
	if command -v dotnet &> /dev/null; then
		echo "Configuring dotNET for user $(whoami)."
		./install-dotnet-6.sh
		echo "dotNET local config done!"
		echo 'Installing Entity Framework tool'
		dotnet tool install --global dotnet-ef
		echo 'Entity Framework Install done'
		echo 'Installing Cake tool'
		dotnet tool install --global Cake.Tool
		echo 'Cake Install done'
		echo 'Installing Sonar Scanner tool'
		dotnet tool install --global dotnet-sonarscanner
		echo 'Sonar Scanner Install done'
		echo 'Installing Paket tool'
		dotnet tool install --global Paket
		echo 'Paket Install done'
		echo 'Installing ReSharper CLI tool'
		dotnet tool install --global JetBrains.ReSharper.GlobalTools
		echo 'ReSharper Install done'
		echo 'Installing ASP.NET Code Generator tool'
		dotnet tool install --global dotnet-aspnet-codegenerator
		echo 'ASP.NET Code Generator Install done'
		echo 'Installing Electron.net tool'
		dotnet tool install --global ElectronNET.CLI
		echo 'Electron.NET Install done'
	fi

	#Configuring Oh My Posh
	if command -v oh-my-posh &> /dev/null; then
		echo 'Configuring Oh My Posh...'
		mkdir -v ~/.poshthemes
		wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
		unzip -v ~/.poshthemes/themes.zip -d ~/.poshthemes
		chmod -v u+rw ~/.poshthemes/*.omp.*
		rm -v ~/.poshthemes/themes.zip
		echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc
		echo 'Oh My Posh configured.'
	fi

	if command -v exa &> /dev/null; then
		echo 'Creating a alias for "exa --icons" to easy use instead of "ls".'
		echo 'alias lst="exa --icons";' >> ~/.bashrc
		echo 'done.'
	fi

	echo 'Installing RUST complete.'
	# Rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-init.sh
	chmod -v +x rustup-init.sh
	./rustup-init.sh -v -y --profile complete
	rm -v rustup-init.sh
	echo 'RUST install done.'

	echo "configuring user side, for user $USER"
	if command -v docker &> /dev/null; then
		echo 'Creating a new group for Docker, to run "docker" command without "sudo".'
		echo "If you're required to type root password, please, type it!"
		newgrp docker
		echo 'Configuring Portainer Community Edition.'
		docker volume create portainer_data
		docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always \
		-v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
		docker ps
		echo 'Portainer configured! Access portainer with browser at https://localhost:9443'
		echo 'Configuring MySQL Server.'
		docker volume create mysql_data
		docker run -v mysql_data:/var/lib/mysql --name mysql-local -e MYSQL_ROOT_PASSWORD=root -d mysql:latest --verbose
    echo -e "MySQL Server on Docker configured!\nServer and port: localhost:3306"
		echo 'Docker done.'
	fi

	if ! command -v brew &> /dev/null; then
	  echo 'Installing Homebrew.'
	  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	  echo "Homebrew installed. Homebrew version: $(brew --version)"
	fi

	echo
	echo
	echo 'Configure your terminal to use any [...]Nerd Font (FiraCode Nerd Font is recommended).'
fi
