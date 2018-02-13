#######################################################
# Ce script à pour but de tester si le serveur HTTP   #
# est bien en route. On effectue des ping d'abord sur #
# l'IP pour tester le serveur puis via le nom de      #
# domaine pour vérifier la résolution de nom. Enfin   #
# on affiche le temps nécessaire pour joindre le      #
# serveur en ms. Le tout est convertit en un fichier  #
# au format CSV.                                      #
#######################################################
# Copyright@2018, all-rights reserved :               #
# AIGRET Nathanaël, HOUSSAIS Nathanaël, MARJOLET      #
# Louis, AGOSTINI Charles.                            #
#######################################################

rm -f *.html #supprime le ou les précédents fichiers en .html
rm -f *.csv #supprime le ou les précédents fichiers en .csv

IP="8.8.8.8" #IP à tester
DOMAIN="google-public-dns-a.google.com" #nom de domaine à tester

ping -c 1 $IP > ipPingStorage.tmp #sauvegarde une requête ICMP via IP dans un fichier temporaire
grep "100%" ipPingStorage.tmp > isIpSuccess.tmp #récupère la ligne avec la mention "100%" si elle existe et la stock dans un fichier temporaire
a=`wc -l isIpSuccess.tmp | cut -d' ' -f1` #isole la valeur numérique devant "%" si elle existe, la variable vaut 1 ou 0

if [ $a -eq 1 ] #si a=1
then
	ipPing="Fail" #si oui c'est que le ping via IP ne fonctionne pas
else
	ipPing="Success" #sinon le ping via IP fonctionne
fi

ping -c 1 $DOMAIN > domainPingStorage.tmp #sauvegarde une requête ICMP via DomainName dans un fichier temporaire
grep "100%" domainPingStorage.tmp > isDomainSuccess.tmp #récupère la ligne avec la mention "100%" si elle existe et la stock dans un fichier temporaire
b=`wc -l isDomainSuccess.tmp | cut -d' ' -f1` #isole la valeur numérique devant "%" si elle existe, la variable vaut 1 ou 0

if [ $b -eq 1 ] #si b=1
then
	domainPing="Fail" #si oui c'est que le ping via DomainName ne fonctionne pas
else
	domainPing="Success" #sinon le ping via DomainName fonctionne
fi

msTime=`cut -s -d= -f4 ipPingStorage.tmp` #on récupère uniquement une valeur numérique suivie de "ms" dans le fichier temporaire

rm -f *.tmp #on supprime tous les fichiers temporaires

echo "IP PING,DOMAIN PING,TIME" > connectionStatus.csv #on ajoute au fichier CSV des noms de colonnes pour nos valeurs
echo ${ipPing},${domainPing},${msTime} >> connectionStatus.csv #on ajoute les différentes valeurs au fichier csv
