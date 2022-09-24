import subprocess
import sys
from bs4 import BeautifulSoup


def get_current_distro():
    # Get current distro
    distro = subprocess.check_output("lsb_release -is", shell=True)
    distro = distro.decode("utf-8").strip()
    if distro.lower() == "debian":
        distro = "Debian"
    else:
        distro = "Ubuntu"
    return distro


def get_version_distro():
    # Get version distro
    version = subprocess.check_output("lsb_release -rs", shell=True)
    version = version.decode("utf-8").strip()
    return version


def get_codenome_distro():
    # Get codenome distro
    codenome = subprocess.check_output("lsb_release -cs", shell=True)
    codenome = codenome.decode("utf-8").strip()
    return codenome


def get_link_virtualbox(param):
    latest_ver_vbox_stable = subprocess.check_output(
        'curl -fsSL http://download.virtualbox.org/virtualbox/LATEST.TXT', shell=True
    ).decode('utf-8').strip()
    content_vbox_scraping = subprocess.check_output([
        'curl', '-fsSL', f'http://download.virtualbox.org/virtualbox/{latest_ver_vbox_stable}/'
    ]).decode('utf-8').strip()
    arch = subprocess.check_output(['dpkg', '--print-architecture']).decode('utf-8').strip()
    version = latest_ver_vbox_stable.split('.')
    soup = BeautifulSoup(content_vbox_scraping, 'html.parser')
    all_links = soup.find_all('a', href=True, text=False)
    for link in all_links:
        if link['href'].endswith('.deb'):
            build_number = f"{link['href'].split('_')[1]}".replace(f'{latest_ver_vbox_stable}-', '')
            build_number = build_number.replace(arch, '').replace(get_codenome_distro(), '')
            build_number = build_number.replace(get_current_distro(), '').replace('~', '')
            file_name = f'virtualbox-{version[0]}.{version[1]}_{latest_ver_vbox_stable}-'
            file_name += f'{build_number}~{get_current_distro()}~{get_codenome_distro()}_{arch}.deb'
            if link['href'] == file_name:
                if param.lower() == 'link':
                    return f"http://download.virtualbox.org/virtualbox/{latest_ver_vbox_stable}/{link['href']}"
                elif param.lower() == 'filename':
                    return file_name
                elif param.lower() == 'build':
                    return build_number
                else:
                    return None


def print_instructions():
    print('\tlink => to get the link to download the file to install VirtualBox')
    print('\tfilename => to get the filename to save downloaded file to install VirtualBox')
    print('\tbuild => to get the build number of installer VirtualBox')


if __name__ == "__main__":
    if len(sys.argv) == 1:
        print('No arguments passed. Please pass one of the following arguments: link, filename or build')
        print_instructions()
        exit(1)
    elif len(sys.argv) >= 3:
        print('Too many arguments passed. Please pass only one of the following arguments: link, filename or build')
        print_instructions()
        exit(1)
    got_link = get_link_virtualbox(sys.argv[1]);
    if got_link is not None:
        print(got_link)
    else:
        print('Invalid argument passed. Please pass only one of the following arguments: link, filename or build')
        print_instructions()
        exit(1)
