require "rubySC"

p "enclenchage de la machine"

SC.demarrer

sleep (5)

p "chargement d'un fichier"

Partition.importer "score.json"

