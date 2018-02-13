#######################################################
# Ce script à pour but de copier certains fichiers de #
# config pour les archiver pour notre PRA             #
#######################################################
# Copyright@2018, all-rights reserved :               #
# AIGRET Nathanaël, HOUSSAIS Nathanaël, MARJOLET      #
# Louis, AGOSTINI Charles.                            #
#######################################################

rm -f *.tar.gz #supprime toutes les archives en tar.gz du répertoire

cp -f /etc/apache2/sites-available/sites.conf ./Apache_Backup #copie le fichier dans le sous-répertoire Apache_Backup

tar czvf apache_backup.tar.gz ./Apache_Backup #archive le répertoire Bind_Backup avec le nom apache_backup.tar.gz
