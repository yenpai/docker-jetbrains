#!/bin/bash

SCRIPT_PATH=${HOME}/.local/phpstorm-launcher
LAUNCHER_PATH=${HOME}/.local/share/applications
LAUNCHER_FILE=${LAUNCHER_PATH}/jetbrains-phpstorm.desktop

install() {
	echo "Install PhpStorm to Ubuntu 15.10 launcher ... "

	echo " ==> Create ${HOME}/.WebIde100"
	mkdir -p ${HOME}/.WebIde100 || exit 1
	
	echo " ==> Copy files to ${SCRIPT_PATH}"
	mkdir -p ${SCRIPT_PATH} || exit 1
	cp -rf ./phpstorm-launcher/phpstorm.* ${SCRIPT_PATH} || exit 1

	echo " ==> Create ${LAUNCHER_FILE}"
	mkdir -p ${LAUNCHER_PATH} || exit 1
	echo "[Desktop Entry]" >> ${LAUNCHER_FILE}
	echo "Version=1.0" >> ${LAUNCHER_FILE}
	echo "Type=Application" >> ${LAUNCHER_FILE}
	echo "Name=PhpStorm" >> ${LAUNCHER_FILE}
	echo "Icon=${SCRIPT_PATH}/phpstorm.png" >> ${LAUNCHER_FILE}
	echo "Exec=${SCRIPT_PATH}/phpstorm.sh" >> ${LAUNCHER_FILE}
	echo "Comment=Develop with pleasure!" >> ${LAUNCHER_FILE}
	echo "Categories=Development;IDE;" >> ${LAUNCHER_FILE}
	echo "Terminal=false" >> ${LAUNCHER_FILE}
	echo "StartupNotify=true" >> ${LAUNCHER_FILE}
	echo "StartupWMClass=jetbrains-phpstorm" >> ${LAUNCHER_FILE}

}

remove() {
	echo "Remove PhpStorm in Ubuntu 15.10 launcher ... " && \
		rm -rf ${SCRIPT_PATH} && \
		rm -f ${LAUNCHER_FILE}
}

case "$1" in
	install)
		remove
		install
		;;
	remove)
		remove
		;;
	*)
		echo $"Usage $0 {install|remove}"
		exit 1
esac

