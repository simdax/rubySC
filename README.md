#Coucou M.A.Oistes fous !

Vous avez carrément envie de faire de la grosse musique de bâtard ?

Vous voulez créer vous-même cette grosse musique de bâtard, mais en même
temps être un peu aidé par un logiciel non moins autant de bÂtard ?

Mais ouais ! Vous êtes au bon endroit !

![http://upload.wikimedia.org/wikipedia/commons/6/6f/Beethoven.jpg]

## Installation

Vous devez avoir installé [superCollider](http://supercollider.github.io/).

### Intégrité morale

`gem install rubySC `

Pour l'instant, je n'ai testé
le programme que sur linux, et l'appel au programme est fait par une
bonne grosse commande 'system'

Il y a un petit script "installation", qui peut peut-être être utile.

## Utilisation

RubySC est construit autour de deux idées

1.  rubySC complète à sa manière
[SCruby](https://github.com/maca/scruby) en offrant une interface avec
Super Collider à coup de gros d'appels OSC bien sales.

2. rubySC implémente la bibliothèque JTLib de SuperCollider, cette dernière étant tournée
vers le 'scriptage de Patterns', aznoaz le _live coding_, agaga le scriptage de partition plus que la
recherche acoustique _per se_.


## Je veux faire de la musique !

`require SC`

qui créé sévéralz objets

*SC qui gère le bouzin de manière global, et qu'on va laisser tranquille la plupart du temps

`
SC.listeVoix ## raccourci "l"
SC.updateScore
SC.play
`

* Des "voix", c'est-à-dire un mélange de 7 paramètres

  * instrument : regardez les noms des synthdef dans "init.sc" (ils proviennent tous de recherches sur [SCcode](http://sccode.org/))
  * dur : les rythmes de votre mélodie
  * degree : les notes de votre mélodie
  * amp : le volume de la mélodie
  * octave : le registre dans lequel se situe votre voix
  * root : le micro-registre, utilisé pour faire des marches par exemple
  * scale : l'echelle utilisé pour votre mélodie

##Mais c'est trop casse-couilles

Exactly ! Alors on devient trianglement plus user-friendly !


`Melodie.new ## génère une mélodie et un rythme grâce à un soupçon de magie


On peut ensuite modifier ces voix

	`SC.set ({ :amp => 0.2, :instrument => :wobble, :

* arrêter ou reprenez vos voix : 
   
   ` mu.stop :voixUn, :voixDeux ## arrête deux voix
    mu.play :voixUn ## reprend voixUn
    mu.remove :all  ## arrête tout et supprime les voix `

Les voix sont stockées dans 'listeVoix'

	SC.listeVoix.inspect

* Deux modules stockent des fonctions plus intéressantes.

	1. Partition, gère tout ce qui est transposition de masse
	1. Marche, permet de transposer la mélodie d'une voix
	   `Marche.diatonique :nomVoix, intervalleDeMarche, nbRepetitions`
	   `Marche.diatonique :superius, 2, 2 ## deux marches par tierce ascendante`

* Vous pouvez essayer de rajouter des instruments dans "init.sc", ou
bien en apprenant SuperCollider, ou bien en cherchant par vous-mêmes
des plugins sur le net.

== 


Copiez-le comme des gros gorets, qu'un truc un peu simple un jour
surgisse de ce monde de fous de MAOistes qui veulent détruire le monde
à force de complexitudinités...

>>>>>>> aff742cafef9b36d744548c85b04fe81943b7a2e
