# -*- coding: utf-8 -*-

require 'json'
require 'yaml'

## fonctions de plus haut niveau
module RubySC_CONST

  ## Quelques constantes, notamment pour les rythmes, c'est toujours
  ## plus pratique


#########

# Pour les accords

  AccordMaj=[[0,4,7]]

end

module SoundFile

  def  self.charger fileName, departBool=true, tpsDattente=0.05
    SC.send %Q{b=Buffer.read(s,'#{fileName}')}
    if departBool
      sleep tpsDattente
      self.play
    end
  end

  def self.play
    SC.send "b.play"
  end

  def self.pause
    SC.send "b.pause"
  end
end

## module utiliser pour faire des choses au niveau de toutes les voix.

module Partition

  ## importation par JSON la structure attendue est la suivante:
  ## section (une par fichier)
  ##  ----- voix
  ##  ----- paramDeVoix

  def self.importerJSON nomFichierJSON, jouerBool=false

    data = JSON.load File.open(nomFichierJSON)
    data.each do |k, v|
      SC.set jouerBool, v, k
    end

  end


  def self.importerYAML nomFichierYAML, jouerBool=false

    data = YAML.load File.open(nomFichierJSON)
    data.each do |k, v|
      SC.set jouerBool, v, k
    end

  end

  def self.echelle echelle
    SC.listeVoix.each_key do |voix|
      SC.set true, ({"scale" => echelle}), voix
    end
    SC.updateScore
  end

  def self.transpose intervalle
    SC.listeVoix.each_key do |voix|
      SC.set true, ({"root" => intervalle}), voix
    end
    self.updateScore
  end

end

## module pour gérer des marches.

module Marche

  def self.marcheChromatique  intervalles, voix

    nbFois=SC.listeVoix[voix.name].degree.length
    voix.setRoot ({"root" => "Pstutter(#{nbFois}, Pseq(#{intervalles}, inf))"})
    SC.updateScore

  end

  def self.marcheDiatonique voix, intervalle

    melodie=SC.listeVoix[voix].degree

    tmp= Array.new(intervalle.size) do |x|
      t=melodie.map { |note|
        if note.is_a? Array then
          note.map do |y| y+intervalle[x] end
        else
          note+intervalle[x]*x
        end }
      "Pseq(#{t})"
    end

    SC.updater voix, "degree", "[#{tmp.join(',')}]"
    SC.listeVoix[voix].information="en marche ! ..."

  end
end

module Echelle

  def self.determineEchelle voix

    ## fonction lente à cause d'un comportement étrange de Super Collider pour donner les valeurs de Scale..

    echelleVoix="Scale."+SC.listeVoix[voix].scale
    longueurEchelle=SC.ask("#{echelleVoix+".semitones.size"}")[0]

    valeursEchelles= Array.new(longueurEchelle) do |x|
      x =  SC.ask("#{echelleVoix+".semitones[#{x}]"}")[0]
    end

    p valeursEchelles

  end

end
