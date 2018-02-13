#######################################################
# Ce script à pour but de copier certains fichiers de #
# config pour les archiver pour notre PRA             #
#######################################################
# Copyright@2018, all-rights reserved :               #
# AIGRET Nathanaël, HOUSSAIS Nathanaël, MARJOLET      #
# Louis, AGOSTINI Charles.                            #
#######################################################

rm -f *.tar.gz #supprime toutes les archives en tar.gz du répertoire

cp -f /etc/dhcp/dhcpd.conf ./DHCP_Backup #copie le fichier dans le sous-répertoire DHCP_Backup

tar czvf dhcp_backup.tar.gz ./DHCP_Backup #archive le répertoire DHCP_Backup avec le nom dhcp_backup.tar.gz
