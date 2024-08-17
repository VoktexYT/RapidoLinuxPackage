PACKAGE_NAME="rapido"

echo -e "\033[1;34m\nConvert src/ files to bin/ \033[0m\n"
shc -f ./src/rapido.sh -o ./usr/local/bin/rapido

cd ..

echo -e "\n\033[1;34m\nBuild .deb package \033[0m\n"
dpkg-deb --build RapidoLinuxPackage

if dpkg -s "$PACKAGE_NAME" > /dev/null 2>&1; then
    echo -e "\033[1;34m\nUninstall $PACKAGE_NAME package \033[0m\n"
    sudo dpkg -r rapido
fi

echo -e "\n\033[1;34m\nInstall $PACKAGE_NAME package \033[0m\n"
sudo dpkg -i RapidoLinuxPackage.deb

echo -e "\n\033[1;32m\n$PACKAGE_NAME is installed ! \033[0m\n"
