require "rubySC"
require 'colorize'


p "enclenchage de la machine"

SC.demarrer

sleep 2

p "chargement d'un fichier"
Partition.importer "score.json"
p SC.listeVoix
p SC.portSuperCollider

p "normalement on devrait entendre du son".red

sleep 3



