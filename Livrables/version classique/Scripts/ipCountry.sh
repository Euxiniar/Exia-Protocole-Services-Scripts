#######################################################
# Ce scripts à pour but de générer une liste des IPs  #
# associée au pays d origine de l addresse IP dans un #
# fichier au format CSV. Ces IPs proviennent des logs #
# de connection de notre serveur Apache.              #
#######################################################
# Copyright@2018, all-rights reserved :               #
# AIGRET Nathanaël, HOUSSAIS Nathanaël, MARJOLET      #
# Louis, AGOSTINI Charles.                            #
#######################################################

rm -f *.csv #supprime tous les fichiers d extension csv

cut -d- -f1 /var/log/apache2/access.log >> ipList.tmp #recupere uniquement les IPV4 du fichier log du serveur HTTP, et les sauvegarde dans un fichier tmp

while read line; #tant qu il y a des lignes dans le documents
do
    a=`GET http://ip-api.com/csv/$line | cut -d, -f2` #a prend la valeur du PAYS que l on recupere grace a une api
    echo ${a},${line} >> connectionStats.tmp #on ajoute au fichier tmp, l addresse IP et le PAYS correspondant
done < ipList.tmp #on utilise le fichier ipList tmp en source du while

sort +1 -2 connectionStats.tmp | uniq >> coStats.tmp #trie le fichier puis supprime les doublons
echo "COUNTRY   ,    IP ADDRESS\n" > connectionStats.csv #ajoute des titres de colonnes pour nos valeurs
sed 's/"//g' coStats.tmp >> connectionStats.csv #ajoutes nos valeurs au fichier CSV tout en supprimant les guillemets

rm -f *.tmp #supprime tous les fichier .tmp
