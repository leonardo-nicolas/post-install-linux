#!/bin/bash

install_dependencies_deb() {
	apt-get install -y ibc6
	apt-get install -y libgcc-s1
	apt-get install -y libgssapi-krb5-2
	apt-get install -y libicu52
	apt-get install -y libicu57
	apt-get install -y libicu63
	apt-get install -y libicu67
	apt-get install -y libssl1.0.0
	apt-get install -y libssl1.1
	apt-get install -y libstdc++6
	apt-get install -y zlib1g
}

install_dependencies_rpm() {
	yum install -y krb5-libs
	yum install -y libicu
	yum install -y openssl-libs
}

install_dotnet() {
	echo "Installing dotNET 6.0.100, released at november 8, 2021."

	if command -v apt-get &> /dev/null; then
		apt-get install -y curl
		apt-get install -y wget
		apt-get install -y gnupg
		apt-get install -y gnupg2
		apt-get install -y apt-transport-https
		apt-get install -y ca-certificates
		apt-get install -y lsb-release
		install_dependencies_deb
	else
		if command -v dnf &> /dev/null; then
			dnf install -y curl
			dnf install -y wget
			dnf install -y gnupg
			dnf install -y gnupg2
			dnf install -y apt-transport-https
			dnf install -y ca-certificates
			dnf install -y lsb-release
			install_dependencies_rpm
		else
			if command -v yum &> /dev/null; then
				yum install -y curl
				yum install -y wget
				yum install -y gnupg
				yum install -y gnupg2
				yum install -y apt-transport-https
				yum install -y ca-certificates
				yum install -y lsb-release
				install_dependencies_rpm
			else
				if command -v pacman &> /dev/null; then
					pacman -S -y curl
					pacman -S -y wget
					pacman -S -y gnupg
					pacman -S -y gnupg2
					pacman -S -y apt-transport-https
					pacman -S -y ca-certificates
					pacman -S -y lsb-release
				fi
			fi
		fi
	fi

	if ! command -v mono &> /dev/null; then
		echo "Mono isn't installed. But you'll have some moments that you'll need the mono libraries or use the mono for run some apps, thats dotNET can't run it..."
		echo "Read the all instructions in https://www.mono-project.com/download/stable/ to install Mono."
	fi

	wget https://download.visualstudio.microsoft.com/download/pr/17b6759f-1af0-41bc-ab12-209ba0377779/e8d02195dbf1434b940e0f05ae086453/dotnet-sdk-6.0.100-linux-x64.tar.gz -O dotnet-sdk-6.0.100-linux-x64.tar.gz
	mkdir /usr/share/dotnet
	tar -xzvf dotnet-sdk-6.0.100-linux-x64.tar.gz -C /usr/share/dotnet
	rm dotnet-sdk-6.0.100-linux-x64.tar.gz
	ln -sv /usr/share/dotnet/dotnet /usr/bin/dotnet
	echo "dotNET $(dotnet --version) was installed successful!"
	echo "if you need to remove, run this script with 'remove' param."
}

uninstall_dotnet() {
	echo "Uninstalling dotNET $(dotnet --version)..."
	echo "Please, wait!"
	unlink /usr/bin/dotnet
	rm -rv /usr/share/dotnet
	echo "dotNET 6.0.100 was uninstalled successful!"
	echo "It's a good idea to you reboot your computer..."
}

if ! [ "$EUID" -ne 0 ]; then
	if ! [[ "$1" =~ ^(remove|uninstall)$ ]]; then
		install_dotnet
	else
		uninstall_dotnet
	fi
	exit 0
else
	if command -v dotnet &> /dev/null; then
		echo -e 'if ! [[ $PATH =~ $HOME/.dotnet/tools ]]; then\n\texport PATH="$PATH:$HOME/.dotnet/tools"\nfi' >> $HOME/.bashrc
		echo 'dotNET tools path configured into bashrc.'
	else
		echo "Please, run as SUDO!!!"
		exit 1
	fi
fi
