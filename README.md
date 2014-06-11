<<<<<<< HEAD
# RubySC

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rubySC'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubySC

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rubySC/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
=======
# rubySC

rubySC est une petite biliothèque qui complète à sa manière
[SCruby](https://github.com/maca/scruby) en offrant une interface avec
la bibliothèque JTLib de SuperCollider, cette dernière étant tournée
vers le live coding, et le scriptage de partition plus que la
recherche acoustique _per se_.

## Installation

vous devez avoir installé supercollider. Pour l'instant, je n'ai testé
le programme que sur linux, et l'appel au programme est fait par une
bonne grosse commande 'system'

## Utilisation

* Un objet "SC" s'occupe de l'interface OSC avec superCollider.

`SC.demarrer`

* On ajoute des "voix", c'est-à-dire un mélange de 7 paramètres

  * instrument : regardez les noms des synthdef dans "init.sc" (ils proviennent tous de recherches sur [SCcode](http://sccode.org/))
  * dur : les rythmes de votre mélodie
  * degree : les notes de votre mélodie
  * amp : le volume de la mélodie
  * octave : le registre dans lequel se situe votre voix
  * root : le micro-registre, utilisé pour faire des marches par exemple
  * scale : l'echelle utilisé pour votre mélodie

`SC.set paramètre(hash), :nomVoix (ou "nomVoix")`
plus précisément, avec "au clair de la lune" :

	` SC.set ({ :degree => [0,0,0,1,2,1,0,2,1,1,0], :dur => [1, [1, 1, 1 , 1 ,2 ,2 ,1 ,1 ,1 ,1 ,4]]}) , :superius
	  SC.set ({ :degree => [[0, 2, 4], [0,3,5], [0,2,4], [1,3,4], [0,2,4], [1,3,4], [0,2,4]], :dur => [1, [2,2,2,2,2,2,4]])}, :basse`

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
