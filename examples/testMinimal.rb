require "rubySC"

p "enclenchage de la machine"

SC.demarrer

sleep 4

p "chargement d'un fichier"

Partition.importer "score.json"

sleep 3

