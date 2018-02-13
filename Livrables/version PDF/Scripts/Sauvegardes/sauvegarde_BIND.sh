#######################################################
# Ce script à pour but de copier certains fichiers de #
# config pour les archiver pour notre PRA             #
#######################################################
# Copyright@2018, all-rights reserved :               #
# AIGRET Nathanaël, HOUSSAIS Nathanaël, MARJOLET      #
# Louis, AGOSTINI Charles.                            #
#######################################################

rm -f *.tar.gz #supprime toutes les archives en tar.gz du répertoire

cp -f /etc/bind/db.carnofluxe.fr ./Bind_Backup #copie le fichier dans le sous-répertoire Bind_Backup
cp -f /etc/bind/db.carnofluxe.local ./Bind_Backup #copie le fichier dans le sous-répertoire Bind_Backup
cp -f /etc/bind/db.10.168.192 ./Bind_Backup #copie le fichier dans le sous-répertoire Bind_Backup
cp -f /etc/bind/named.conf.local ./Bind_Backup #copie le fichier dans le sous-répertoire Bind_Backup

tar czvf bind_backup.tar.gz ./Bind_Backup #archive le répertoire Bind_Backup avec le nom bind_backup.tar.gz
