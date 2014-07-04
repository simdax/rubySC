require "rubySC"
require 'colorize'

p "enclenchage de la machine"

sleep 2

p "discutation avec la machine"

SC.ask "NetAdrr.langPort"

sleep 2

p "chargement d'un fichier"
Partition.importer "score.json"
SC.play "un"

p "creation d'une voix au hasard"
a=Voix.new "voixAuHasard"
SC.play "voixAuHasard"



p SC.listeVoix
p SC.portSuperCollider

p "normalement on devrait entendre du son".red

sleep 10



