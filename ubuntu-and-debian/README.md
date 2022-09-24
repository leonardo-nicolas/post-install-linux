# To read in english, [🇬🇧click here🇺🇸](#English).
# Para ler em português, [🇧🇷clique aqui🇵🇹](#Portugues).


<h1 id="English">🇬🇧English🇺🇸</h1>


All shell scripts in this repository are intended to be used in Ubuntu and Debian systems.
To install all dependencies (such as libraries, compilers, etc.), softwares (such as navigators, players, IDEs, etc)
and configurations.

### first step: 
Clone (or download as zip) this repository.

If you intend to clone, open the terminal and use the command below:
```bash
$ git clone https://github.com/leonardo-nicolas/post-install-linux.git
$ cd post-install-linux
```
And then, go to ***third step***.

### second step: 
* If you downloaded as zip, unzip it into a folder.
* If you cloned this repository (using `git clone`), go to the folder.
### third step: 
open the terminal (if your terminal is closed) and go to the folder where you cloned or unzipped the repository 
and run command bellow:
```bash
$ cd ubuntu-and-debian
$ chmod +x ubuntu-post-install.sh
$ sudo ./ubuntu-post-install.sh
```
Wait for the installation to finish. After finishing, the computer will restart immediately.

After restart your computer, open the terminal again, go to the folder where you cloned or unzipped the repository 
and run command bellow:
```bash
$ ./ubuntu-post-install.sh
```
This step will configure some things, such some dotnet CLI tools, [Rust](https://www.rust-lang.org/) install (**It
doesn't make via `sudo` privilege**) oh-my-posh themes, etc.

### Done!

WARNING: This script has been tested on Ubuntu 22.04 LTS and Zorin OS 20.04 LTS. 
If you have any issues, please open an issue in this repository reporting the bug or submit 
a pull request. If you want to contribute, feel free to fork this repository and submit 
a pull request.

<h1 id="Portugues">🇧🇷Português🇵🇹</h1>

Todos os scripts de shell neste repositório devem ser usados em sistemas derivados de Ubuntu e Debian. 
Para instalar todas as dependências (como bibliotecas, compiladores, etc.), softwares (como navegadores, players, IDEs, 
etc.) e configurações.

### Primeiro passo: 
Clone (ou baixe como zip) este repositório.

Se você pretende clonar, abra o terminal e use o comando abaixo:
```bash
$ git clone https://github.com/leonardo-nicolas/post-install-linux.git
$ cd post-install-linux
```
E então, vá para o ***terceiro passo***.

### segundo passo: 
* Se você baixou como zip, descompacte-o em uma pasta.
* Se você clonou este repositório (usando `git clone`), vá para a pasta.

### terceiro passo: 
abra o terminal (caso seu terminal esteja fechado) e vá até a pasta onde você clonou ou descompactou o repositório e 
execute o comando abaixo:
```bash
$ cd ubuntu-and-debian
$ chmod +x ubuntu-post-install.sh
$ sudo ./ubuntu-post-install.sh
```
Aguarde a conclusão da instalação. Após terminar, o computador será reiniciado imediatamente.

Após reiniciar seu computador, abra o terminal novamente, vá até a pasta onde você clonou ou descompactou o repositório
e execute o comando abaixo:
```bash
$ ./ubuntu-post-install.sh
```
Esta etapa configurará algumas coisas, como algumas ferramentas do dotNET CLI, instalação do 
[Rust](https://www.rust-lang.org/) (**NÃO É FEITO via sudo**), temas do [Oh My Posh](https://ohmyposh.dev/), etc.


AVISO: Este script foi testado apenas no Ubuntu 22.04 LTS e no Zorin OS 20.04 LTS. Se você tiver algum problema, abra 
uma issue neste repositório relatando o erro ou envie um pull request. Se quiser contribuir, fique à vontade para
fazer um fork deste repositório e enviar um pull request.

# 🇧🇷Softwares & ferramentas🇵🇹 | 🇬🇧Softwares & tools🇺🇸

* [Docker](https://www.docker.com/)
  * [Portainer](https://www.portainer.io/)
  * [MySQL Docker](https://hub.docker.com/_/mysql)
  * [Docker Compose](https://docs.docker.com/compose/)
* [Terrafom](https://www.terraform.io/)
* [Git](https://git-scm.com/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Postman](https://www.postman.com/)
* [DBeaver](https://dbeaver.io/)
* [GitKraken](https://www.gitkraken.com/)
* [JetBrains IDEs](https://www.jetbrains.com/) (snap)
  * [JetBrains IntelliJ IDEA Ultimate](https://www.jetbrains.com/pt-br/idea/)
  * [JetBrains PyCharm Professional](https://www.jetbrains.com/pt-br/pycharm/)
  * [JetBrains WebStorm](https://www.jetbrains.com/webstorm/)
  * [JetBrains PhpStorm](https://www.jetbrains.com/phpstorm/)
  * [JetBrains Rider](https://www.jetbrains.com/rider/)
  * [JetBrains CLion](https://www.jetbrains.com/clion/)
  * [JetBrains DataGrip](https://www.jetbrains.com/datagrip/)
  * [JetBrains DataSpell](https://www.jetbrains.com/dataspell/)
  * [JetBrains GoLand](https://www.jetbrains.com/go/)
  * [JetBrains RubyMine](https://www.jetbrains.com/ruby/)
  * [Android Studio](https://developer.android.com/studio)
* [Draw.io](https://app.diagrams.net/)
* [Astah UML](https://astah.net/editions/community)
* [Google Chrome](https://www.google.com/intl/pt-BR/chrome/)
* [Microsoft Edge](https://www.microsoftedgeinsider.com/pt-br/)
* [Amazon Corretto ***OpenJDK***](https://aws.amazon.com/pt/corretto/)
* [Kotlin](https://kotlinlang.org/)
* [Mono](https://www.mono-project.com/)
* [dotNET 6](https://dotnet.microsoft.com/download)
  * [Entity Framework Core](https://docs.microsoft.com/pt-br/ef/core/)
  * [Cake](https://cakebuild.net/)
  * [SonarScanner](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)
  * [Paket](https://fsprojects.github.io/Paket/)
  * [ReSharper CLI](https://www.jetbrains.com/help/resharper/ReSharper_Command_Line_Tools.html)
  * [ASP.NET Code Generator](https://docs.microsoft.com/pt-br/aspnet/core/fundamentals/tools/dotnet-aspnet-codegenerator?view=aspnetcore-6.0)
  * [ElectronNET.CLI](https://github.com/ElectronNET/Electron.NET)
* [PowerShell](https://docs.microsoft.com/pt-br/powershell/)
* [Webfont Kit Generator](https://transfonter.org/)
* [GitHub Desktop For Linux](https://desktop.github.com/)
* [Bootstrap Studio](https://bootstrapstudio.io/)
* [Scene Builder](https://gluonhq.com/products/scene-builder/)
* C/C++
  * [GCC](https://gcc.gnu.org/)
  * [G++](https://gcc.gnu.org/)
  * [GFortran](https://gcc.gnu.org/)
  * [CMake](https://cmake.org/)
  * [Make](https://www.gnu.org/software/make/)
  * [Build Essentials](https://packages.ubuntu.com/pt-br/focal/build-essential)
  * [Get Text](https://www.gnu.org/software/gettext/)
* [NodeJS](https://nodejs.org/en/)
  * [NPM](https://www.npmjs.com/)
  * [Yarn](https://yarnpkg.com/)
  * [Angular CLI](https://angular.io/)
  * [VueJS CLI](https://vuejs.org/)
  * [NestJS CLI](https://nestjs.com/)
  * [http-server](https://www.npmjs.com/package/http-server)
* [PHP 8.1](https://www.php.net/)
  * [Composer](https://getcomposer.org/)
* [Python 3.10](https://www.python.org/)
  * [PIP](https://pypi.org/project/pip/)
* [GoLang](https://golang.org/)
* [Flutter](https://flutter.dev/)
* [Spotify](https://www.spotify.com/br/)
* [Discord](https://discord.com/)
* [Telegram](https://telegram.org/)
* [Authy](https://authy.com/)
* [Microsoft Teams](https://www.microsoft.com/pt-br/microsoft-365/microsoft-teams/group-chat-software)
* [Flameshot](https://flameshot.js.org/)
* [VLC](https://www.videolan.org/vlc/index.pt-BR.html)
* [GIMP](https://www.gimp.org/)
* [Inkscape](https://inkscape.org/pt-br/)
* [Peazip](https://peazip.github.io/)
* [AnyDesk](https://anydesk.com/pt)
* [TeamViewer](https://www.teamviewer.com/pt-br/)
* [Oh My Posh](https://ohmyposh.dev/)
* [OnlyOffice](https://www.onlyoffice.com/pt-br/)
* [VirtualBox](https://www.virtualbox.org/)
* [EXA](https://the.exa.website/)
  * 🇧🇷🇵🇹Com um Alias no .bashrc: `alias lst='exa --icons'`, bastando apenas digitar `lst` para listar os arquivos e pastas, 
    substituindo o tradicional `ls`.🇧🇷🇵🇹
  * 🇬🇧🇺🇸 With an Alias in .bashrc `alias lst='exa --icons'`, just type `lst` to list files and folders, replacing the 
    traditional `ls`. 🇬🇧🇺🇸
* [NeoVim](https://neovim.io/)
* [Neofetch](https://github.com/dylanaraps/neofetch)
* [Snap](https://snapcraft.io/)
* [Flatpak](https://flatpak.org/)
* Papirus Icon Theme
* [FiraCode, JetBrains & Meslo :: NerdFont](https://www.nerdfonts.com/)

**Atenção especial:**<br>

🇧🇷🇵🇹 Para o [oh-my-posh](https://ohmyposh.dev/) e [EXA](https://the.exa.website/) funcionar corretamente, é necessário 
instalar alguma fonte diretamente do [NerdFont](https://www.nerdfonts.com/), como o FiraCode Nerd Font, JetBrains 
Mono Nerd Font, Meslo Nerd Font, ou qualquer outra do site [NerdFont](https://www.nerdfonts.com/), e configurar o seu
terminal para utilizar essa fonte. Fica a recomendação de se usar o 
[FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) por ser a mais completa...🇧🇷🇵🇹

🇬🇧🇺🇸 To [oh-my-posh](https://ohmyposh.dev/) and [EXA](https://the.exa.website/) work correctly, it's necessary to install a 
font directly from [NerdFont](https://www.nerdfonts.com/), such as FiraCode Nerd Font, JetBrains Mono Nerd Font, 
Meslo Nerd Font, or any other from the [NerdFont](https://www.nerdfonts.com/) website, and configure your terminal 
to use that font . It is recommended to use the [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) as it's 
the most complete...🇬🇧🇺🇸