#Coucou M.A.Oistes fous !

Vous avez carrément envie de faire de la grosse musique de bâtard ?

Vous voulez créer vous-même cette grosse musique de bâtard, mais en même
temps être un peu aidé par un logiciel non moins autant de bÂtard ?

Mais ouais ! Vous êtes au bon endroit !

![](http://upload.wikimedia.org/wikipedia/commons/6/6f/Beethoven.jpg =100x100)

## Installation

Vous devez avoir installé [SuperCollider](http://supercollider.github.io/).

### Intégrité morale

```gem install rubySC ```

Pour l'instant, je n'ai testé
le programme que sur linux, et l'appel au programme est fait par une
bonne grosse commande 'system'

Il y a un petit script "installation", qui __peut peut-être être__ utile (bim, port-salut).

## Utilisation

RubySC est construit autour de deux idées

1.  rubySC complète à sa manière
[SCruby](https://github.com/maca/scruby) en offrant une interface avec
Super Collider à coup de gros d'appels OSC bien sales.

2. rubySC implémente la bibliothèque JTLib de SuperCollider, cette dernière étant tournée
vers le 'scriptage de Patterns', aznoaz le _live coding_, agaga le scriptage de partition plus que la
recherche acoustique _per se_.


## Je veux faire de la musique !

```ruby
require SC
```

qui créé sévéralz objets

*SC qui gère le bouzin de manière global, et qu'on va laisser tranquille la plupart du temps

```ruby

SC.listeVoix ## raccourci "li"
SC.updateScore
SC.play

```

* Des "voix", c'est-à-dire un mélange de 7 paramètres

  * instrument : regardez les noms des synthdef dans "init.sc" (ils proviennent tous de recherches sur [SCcode](http://sccode.org/))
  * dur : les rythmes de votre mélodie
  * degree : les notes de votre mélodie
  * amp : le volume de la mélodie
  * octave : le registre dans lequel se situe votre voix
  * root : le micro-registre, utilisé pour faire des marches par exemple
  * scale : l'echelle utilisé pour votre mélodie

###Mais c'est trop casse-couilles

Exactly ! Alors on devient trianglement plus user-friendly !


```ruby
mel=Melodie.new ## génère une mélodie et un rythme grâce à un soupçon de magie
```

on balance ensuite cette Melodie dans le grand monde

```ruby

mel.mettreVoix :piano
mel.setDuree [0,1,2,1,0] #si on est des bâtards
mel.setADSR              #si on est des fous

##j'en passe et des meilleurs !
```



### Mais yen a encore plus !

* Trois modules stockent des fonctions plus intéressantes.

	1. Partition, gère tout ce qui est phénomène de masse
	1. Contrepoint, pour générer des voix à partir d'une cellule génératrice
	1. Harmonie, pour faire des grosses suites d'accords géniales 
	1. Rythme ## à venir

## Des instruments de folie !

* Vous pouvez essayer de rajouter des instruments dans "init.sc", ou
bien en apprenant SuperCollider, ou bien en cherchant par vous-mêmes
des plugins sur le net.
* possibilität de jouer des samples pour avoir un vrai joli son et tout
 

# Grosse conclusion ♡

Copiez-le comme des gros gorets, qu'un truc un peu simple un jour
surgisse de ce monde de fous de MAOistes qui veulent détruire le monde
à force de complexitudinités...
