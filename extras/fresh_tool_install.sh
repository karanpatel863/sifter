#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
INV='\e[7m'
URED='\033[4;31m'
UBLUE='\033[4;34m'

echo -e "${URED}RUNNING THIS SCRIPT WILL REMOVE ALL PREVIOUSLY INSTALLED TOOLS & REINSTALL THEM"
echo -e "${UBLUE}This script should only be used if 'install.sh' fails to install multiple tools"
echo -e "(This seems to only occur on a fresh install of the latest Kali image, otherwise you need not worry)${NC}"
echo -e "${URED}IS THIS WHAT YOU WANT TO DO?(y/n)${NC}"
read AASK
if [[ ${AASK} == "y" ]]; then
	echo -e "${URED}ARE YOU SURE?(y/n)${NC}"
	read ASK
	if [[ ${ASK} == "y" ]]; then
		cd /opt
		sudo rm -rf aapfinder BruteDum DomainFuzz Maryam rapidscan Sitadel ActiveReign flan reconspider SMBGhost armory Dark-Star HoneyCaught NekoBotV1 seeker SniffingBear AttackSurfaceMapper dnstwist ispy omnibus shodansploit WPForce bfac docker-osmedeus Konan onedrive_user_enum XSHOCK sifter
	else
		sleep 1
	fi
else
	sleep 1
fi
sudo apt update && sudo apt-get update && sudo apt full-upgrade
sudo apt-get install -y python wmdocker graphviz kdialog python-dev libmysqlclient-dev python-mysqldb git sqlite3 nmap wpscan nikto dirbuster leafpad figlet nano theharvester docker docker-compose docker.io python3-dnspython python3-geoip python3-whois python3-requests python3-ssdeep nodejs npm wafw00f arp-scan golang mariadb-client mariadb-server eom liblapack.so.3 python-numpy
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking if Sifter is installed${NC}"
if [[ -d /opt/sifter ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sifter is already installed."
	echo -e "${RED}"
	echo "Updating external dependancies."
	echo -e "${NC}"
else
	pwd && cd ..
	sudo mv sifter -t /opt
	sudo chown $USER:$USER -R /opt/sifter
	cd /opt/sifter
    sudo cp sifter /usr/sbin/sifter
	sudo chmod +x /opt/sifter/sifter /usr/sbin/sifter
	sudo chmod +x -R /opt/sifter/modules
	sleep 2
fi


#######################################__Python2 Tools__#######################################################
#
## Python2 Pip Install Fix
#
#echo -e "${URED}Fixing Python2 pip issues for install${NC}"
# shellcheck disable=SC2164
cd /opt


echo -e "${RED}Checking for external dependencies${NC}"
sudo service docker start
#
# 1 # Sniffing Bear
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for SniffingBear${NC}"
if [[ -d '/opt/SniffingBear' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "SniffingBear is already installed"
	echo -e "${NC}"
	cd SniffingBear 
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/MrSuicideParrot/SniffingBear.git
	cd SniffingBear
	sudo pip install -r requirements.txt
fi

#
# 3 # Maryam
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Maryam${NC}"
if [[ -d '/opt/Maryam' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Maryam is already installed"
	echo -e "${NC}"
	cd /opt/Maryam
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/saeeddhqan/Maryam.git
	cd Maryam
	sudo pip install -r requirements
	sudo chmod +x maryam
fi

#
# 4 # DnsTwist
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for DnsTwist${NC}"
if [[ -d /opt/dnstwist ]]; then
	echo -e "${ORNG}"
	figlet -f mini "DnsTwist is already installed."
	echo -e "${NC}"
	cd /opt/dnstwist
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/elceef/dnstwist.git
	cd dnstwist
	sudo apt-get install libgeoip-dev libffi-dev
	sudo BUILD_LIB=1 pip install -r requirements.txt
fi

#
# 5 # HoneyCaught
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for HoneyCaught${NC}"
if [[ -d /opt/HoneyCaught ]]; then
	echo -e "${ORNG}"
	figlet -f mini "HoneyCaught is already installed"
	echo -e "${NC}"
	cd /opt/HoneyCaught 
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/aswinmguptha/HoneyCaught.git
	cd HoneyCaught
	sudo python -m pip install -r requirements.txt
fi

#
# 6 # blackwidow
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Blackwidow${NC}"
if [[ -f /usr/bin/blackwidow && -f /usr/bin/injectx.py ]] || [[ -f /usr/sbin/blackwidow && -f /usr/sbin/injectx.py ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Blackwidow is already installed"
	echo -e "${NC}"
else
	cd /root
	sudo git clone https://github.com/1N3/blackwidow.git
	cd blackwidow
			sudo chmod +x blackwidow injectx.py
	    sudo cp blackwidow /usr/sbin/blackwidow
	    sudo cp injectx.py /usr/sbin/injectx.py
	    pip install -r requirements.txt
fi

#
# 7 # BFAC
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for BFAC${NC}"
if [[ -d '/opt/bfac' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "BFAC is already installed"
	echo -e "${NC}"
	cd /opt/bfac 
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/mazen160/bfac.git
	cd bfac
	sudo python setup.py install
fi

#
# 8 # RapidScan
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Rapidscan${NC}"
if [[ -f "/usr/sbin/rapidscan.py" ]] || [[ -d "/opt/rapidscan" ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Rapidscan is already installed"
	echo -e "${NC}"
	cd /opt/rapidscan
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/s1l3nt78/rapidscan.git
	cd rapidscan
	sudo chmod +x rapidscan.py rapidscan
	sudo mv rapidscan -t /usr/sbin
fi

#
# 9 # shodansploit
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for ShodanSploit${NC}"
if [[ -d "/opt/shodansploit" ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ShodanSploit is already installed."
	echo -e "${NC}"
	cd /opt/shodansploit 
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/shodansploit/shodansploit.git
	sudo chown $USER:$USER -R shodansploit
fi

#######################################__Python3 Tools__#######################################################
#
# 10 # Yuki-Chan
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Yuki-Chan${NC}"
if [[ -d "/root/Yuki-Chan-The-Auto-Pentest" ]] || [[ -d "/root/yuki" ]]; then
    echo -e "${ORNG}"
	figlet -f mini "Yuki-Chan is already installed"
	echo -e "${NC}"
	cd /root/yuki
	sudo git fetch && sudo git pull
else
    cd /root
    sudo git clone https://github.com/s1l3nt78/Yuki-Chan-The-Auto-Pentest.git
    sudo mv Yuki-Chan-The-Auto-Pentest yuki
	cd yuki
	   sudo pip2 install -r requirements.txt
	   sudo apt-get install python3-pip
	   sudo apt --fix-broken install -y
	   sudo pip3 install -r requirements.txt
	   sudo pip3 install wget
	   sudo chmod +x Module --recursive
	   sudo chown $USER:$USER Module --recursive
	   sudo chmod +x wafninja joomscan yuki.sh install-perl-module.sh
	   sudo ./install-perl-module.sh
fi

#
# 11 # ReconSpider 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for ReconSpider${NC}"
if [[ -d "/opt/reconspider" ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ReconSpider is already installed"
	echo -e "${NC}"
	cd /opt/reconspider
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/bhavsec/reconspider.git
	cd reconspider
	sudo python3 setup.py install
fi

#
# 12 # Zeus-Scanner
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Zeus${NC}"
if [[ -d '/opt/Zeus-Scanner' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Zeus is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/Ekultek/Zeus-Scanner
	cd Zeus-Scanner
	sudo docker build .
	echo -e "${W}Please copy and paste the final container's image ID shown above"
	read ID
	sudo docker tag ${ID} zeus
fi

#
# 13 # Elevation of Privilege (Post-Ex)
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for EoP Exploit${NC}"
if [[ -d '/opt/CVE-2020-0683' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "EoP Exploit is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/padovah4ck/CVE-2020-0683
	cd CVE-2020-0683
	sudo zip EoP.zip bin_MsiExploit -r
	sudo chmod 777 EoP.zip
fi

#
# 14 # Flan 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Flan${NC}"
if [[ -d /opt/flan ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Flan is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/s1l3nt78/flan.git
	cd flan
	sudo docker build .
	echo -e "${W}Please copy and paste the final container's image ID shown above${NC}"
	read ID
	sudo docker tag ${ID} flan_scan
	sleep 2
fi

#
# 15 # AttackSurfaceMapper
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Attack Surface Mapper${NC}"
if [[ -d /opt/AttackSurfaceMapper ]] || [[ -d /root/AttackSurfaceMapper ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ASM is already installed."
	echo -e "${NC}"
	cd /opt/AttackSurfaceMapper
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/s1l3nt78/AttackSurfaceMapper.git
	cd AttackSurfaceMapper
	   sudo python3 -m pip install -r requirements.txt
	   sudo cp asm -t /usr/sbin
	   sudo chmod +x /usr/sbin/asm
fi

#
# 16 # ActiveReign 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for ActiveReign${NC}"
if [[ -d '/opt/ActiveReign' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "ActiveReign is already installed"
	echo -e "${NC}"
	cd /opt/ActiveReign
	sudo git fetch && sudo git pull
else
	cd /opt
	sudo git clone https://github.com/m8r0wn/ActiveReign.git
	cd ActiveReign
	sudo pip3 install -r requirements.txt
	sudo python3 setup.py install
	sudo git clone https://github.com/SecureAuthCorp/impacket
	cd impacket
	sudo python3.7 setup.py install
	pip3 install prompt-toolkit==2.0.9 impacket
	ar3 db help
	sudo mkdir /home/$USER/.ar3
	sudo cp ar3/config.json -t /home/$USER/.ar3
	sudo chown $USER:$USER /home/$USER/.ar3
fi

#
# 17 # iSpy 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for iSpy${NC}"
if [[ -d '/opt/ispy' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "iSpy is already installed"
	echo -e "${NC}"
	cd /opt/ispy
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/Cyb0r9/ispy.git
	cd ispy
	chmod +x setup.sh
	sudo ./setup.sh
fi

#
# 18 # Sitadel 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Sitadel${NC}"
if [[ -d '/opt/Sitadel' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sitadel is already installed"
	echo -e "${NC}"
	cd /opt/Sitadel
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/shenril/Sitadel.git
	cd Sitadel
	sudo python3.7 -m pip install .
	sudo python3.7 setup.py install
fi

#
# 19 # Osmedeus 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Osmedeus${NC}"
if [[ -d '/opt/docker-osmedeus' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Osmedeus is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/mablanco/docker-osmedeus.git
	cd docker-osmedeus
	sudo docker build -t mablanco/osmedeus .
fi

#
# 20 # NekoBot 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for NekoBot${NC}"
if [[ -d '/opt/NekoBotV1' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "NekoBot is already installed"
	echo -e "${NC}"
	cd /opt/NekoBotV1
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/tegal1337/NekoBotV1.git
fi

#
# 21 # aSnip
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Installing & Updating aSnip${NC}"
go get -u github.com/harleo/asnip

#
# 22 # Armory 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Armory${NC}"
if [[ -d '/opt/armory' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Armory is already installed"
	echo -e "${NC}"
	cd /opt/armory
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/depthsecurity/armory.git
	cd armory
	sudo python3.7 setup.py install
	armory
fi

#
# 23 # Seeker 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Seeker${NC}"
if [[ -d '/opt/seeker' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Seeker is already installed"
	echo -e "${NC}"
	cd /opt/seeker
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/thewhiteh4t/seeker.git
	cd seeker
	sudo chmod 777 install.sh
	sudo ./install.sh
fi

#
# 24 # AapFinder 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for AapFinder${NC}"
if [[ -d '/opt/aapfinder' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "AapFinder is already installed"
	echo -e "${NC}"
	cd /opt/aapfinder
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/Technowlogy-Pushpender/aapfinder.git
	sudo chown $USER:$USER -R aapfinder
	cd aapfinder
	sudo chmod +x aapfinder.py
	sudo touch targets.txt
fi

#
# 25 # Dark-Star 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Dark Star${NC}"
if [[ -d '/opt/Dark-Star' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Dark Star is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/s1l3nt78/Dark-Star.git
fi

#
# 26 # BruteDUM 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for BruteDUM${NC}"
if [[ -d '/opt/BruteDum' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "BruteDUM is already installed"
	echo -e "${NC}"
	cd /opt/BruteDum
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/GitHackTools/BruteDum.git
fi

#
# 27 # OneFind 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for OneFind${NC}"
if [[ -d '/opt/onedrive_user_enum' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "OneFind is already installed"
	echo -e "${NC}"
	cd /opt/onedrive_user_enum
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/nyxgeek/onedrive_user_enum
fi

#
# 28 # SMBGhost Scanner
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for SMBGhost Scanner${NC}"
if [[ -d '/opt/SMBGhost' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "SMBGhost Scanner is already installed"
	echo -e "${NC}"
	cd /opt/SMBGhost
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo apt-get install python3-pip
	sudo git clone https://github.com/ioncodes/SMBGhost.git
	sudo python3 -m pip install hexdump
fi

#
# 28.1 # SMBGhost Exploit
#
echo -e "${YLW}Checking for SMBGhost Exploit${NC}"
if [[ -d '/opt/SMBGhost_RCE_PoC' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "SMBGhost Exploit is already installed"
	echo -e "${NC}"
	cd /opt/SMBGhost_RCE_PoC
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/chompie1337/SMBGhost_RCE_PoC.git
fi

#
# 29 # xRay 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for xRay${NC}"
if [[ -d '/opt/xray' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "xRay is already installed"
	echo -e "${NC}"
else
	sudo docker pull txt3rob/xray-docker
fi

#
# 30 # WPForce 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for WPForce${NC}"
if [[ -d '/opt/WPForce' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "WPForce is already installed"
	echo -e "${NC}"
	cd /opt/WPForce
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/n00py/WPForce.git
fi

#
# 31 # xShock 
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for xShock${NC}"
if [[ -d '/opt/XSHOCK' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "xShock is already installed"
	echo -e "${NC}"
	cd /opt/XSHOCK
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/capture0x/XSHOCK.git
	cd XSHOCK
	sudo pip3 install -r requirements.txt
fi

#
# 32 # VulnX
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for VulnX${NC}"
if [[ -d '/opt/vulnx' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "VulnX is already installed"
	echo -e "${NC}"
	cd /opt/vulnx
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/anouarbensaad/vulnx.git
	cd vulnx 
	sudo chmod +x install.sh
	sudo ./install.sh
fi

#
# 33 # Omega (Replacing PHPSploit)
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Omega${NC}"
if [[ -d '/opt/phpsploit' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Replacing PHPSploit with Omega"
	echo -e "${NC}"
	sudo rm -rf phpsploit
fi
if [[ -d '/opt/omega' ]]; then
  echo -e "${ORNG}"
  figlet -f mini "Omega is already installed"
  echo -e "${NC}"
  cd /opt/omega
  sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/entynetproject/omega.git
	cd omega
	sudo chmod +x install.sh
	./install.sh
fi

#
# 34 # CredNinja
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for CredNinja${NC}"
if [[ -d '/opt/CredNinja' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "CredNinja is already installed"
	echo -e "${NC}"
	cd /opt/CredNinja
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/Raikia/CredNinja.git
fi

#
# 35 # Impulse
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Impulse${NC}"
if [[ -d '/opt/Impulse' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Impulse is already installed"
	echo -e "${NC}"
	cd /opt/Impulse
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/LimerBoy/Impulse
	cd Impulse
	sudo python3 -m pip install -r requirements.txt
fi

#
# 37 # CredsHarvester
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for CredsHarvester${NC}"
if [[ -d '/opt/creds_harvester' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "CredsHarvester is already installed"
	echo -e "${NC}"
	cd /opt/creds_harvester
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/Technowlogy-Pushpender/creds_harvester.git
	sudo chown $USER:$USER -R /opt/creds_harvester
	cd creds_harvester
	python3 -m pip install pywin32
	sudo python3 -m pip install pywin32
	zip credH.zip *.py
fi

#
# 38 # SayDog
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for SayDog${NC}"
if [[ -d '/opt/saydog-framework' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "SayDog is already installed"
	echo -e "${NC}"
else
	cd /opt/
	sudo git clone https://github.com/saydog/saydog-framework.git
	cd saydog-framework
	sudo sed -i "s/python/python3/g" run
	sudo chmod +x install
	sudo ./install
fi

#
# 39 # Dorks-Eye
# 
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for DorksEye${NC}"
if [[ -d '/opt/dorks-eye' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "DorksEye is already installed"
	echo -e "${NC}"
	cd /opt/dorks-eye
	sudo git fetch && sudo git pull
else
	cd /opt/
	sudo git clone https://github.com/BullsEye0/dorks-eye.git
	cd dorks-eye
	sudo pip3 install -r requirements.txt
fi

#
# 40 # Mentalist
# 
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for Mentalist${NC}"
if [[ -f '/opt/sifter/modules/passtools/Mentalist' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Mentalist is already installed"
	echo -e "${NC}"
else
	cd /opt/sifter/modules/passtools
	wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86_64.zip
	unzip Mentalist*
	rm *.zip
fi

#
# 41 # DCipher
# 
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Installing & updating DCipher${NC}"
sudo npm install dcipher
sudo npm install -g dcipher-cli

#
# 42 # HoneyTel
#
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking for HoneyTel${NC}"
if [[ -f '/opt/HoneyTel' ]]; then
	echo -e "${ORNG}"
	figlet -f mini "HoneyTel is already installed"
	echo -e "${NC}"
else
	cd /opt
	sudo git clone https://github.com/Phype/telnet-iot-honeypot.git HoneyTel
fi

#
## Move Sifter executable to local path (/usr/sbin)
#
cd /opt
sudo chown $USER:$USER /opt/sifter --recursive
chmod +x /opt/sifter --recursive
cd sifter
sudo cp sifter -t /usr/sbin
sudo chown $USER:$USER /usr/sbin/sifter
chmod +x /usr/sbin/sifter
echo -e "${RED}"
figlet "Done."
echo -e "${NC}"
sifter -h
echo -e "${W}Please edit ${YLW}API keys in ${UBLUE}/opt/AttackSurfaceMapper/keylist.asm${NC} ${W}for a better range of scans &"
echo -e "for better results in WPScan goto ${UBLUE}modules/wpscan.sh${NC} ${W}and add"
echo -e " '${UBLUE}--api-token <${URED}your-wpscan-api-token${UBLUE}>${NC}${W}' argument to both commands"
echo -e "please add your ${YLW}shodan-api key to ${UBLUE}modules/credmods/xray.sh${NC} ${W}by '${URED}SHODAN-API${W}'${NC}"

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
