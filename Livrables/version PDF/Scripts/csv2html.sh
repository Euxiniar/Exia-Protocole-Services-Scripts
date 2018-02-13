#######################################################
# Ce script à pour objectif de récupérer les          #
# différents fichiers csv pour les convertir en un    #
# fichier csv et de ensuite le transformer en fichier #
# html pour qu'il soit visible sur notre site en local#
#######################################################
# Copyright@2018, all-rights reserved :               #
# AIGRET Nathanaël, HOUSSAIS Nathanaël, MARJOLET      #
# Louis, AGOSTINI Charles.                            #
#######################################################

rm *.html #on supprime les fichier html

user="euxiniar" #on définit un nom d'utilisateur pour la connexion ssh
host_IP="192.168.10.6" #ip de la machine distante pour connexion ssh
host_path="/home/${user}/coStats/connectionStatus.sh" #PATH pour le scp

cat ../IP/connectionStats.csv > local_stats.csv #on ajoute les données d'un fichier CSV a local_stats.csv
echo "\n \n" >> local_stats.csv	#on rajoute des sauts de ligne pour plus de lisibilité
scp ${user}@${host_IP}:${host_path} ./ #on récupère un fichier sur la machine distante DNS_SLAVE
cat connectionStatus.csv >> local_stats.csv # on ajoute le contenu du fichier acquis à notre local_stats.csv
csv2html -o index.html ./local_stats.csv #on transforme notre csv en html

rm -f *.csv #suppression des fichiers csv
