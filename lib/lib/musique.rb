# -*- coding: utf-8 -*-

load 'lib/circularList.rb'
require 'json'



## fonctions de plus haut niveau

## Quelques constantes, notamment pour les rythmes, c'est toujours
## plus pratique

## Je n'ai mis que les rythmes qui me semblaient
  ## les plus connus


  ## Rythmes à 3 notes

  Pavanne=[2,1,1]

  Sicilienne=[3,1,2]
  Chabada=[3,2,1]

  Tresillo=[3,3,2]
  Syncopette=[1,2,1]

  ## Rythmes à 4 notes
  
## module utiliser pour faire des choses au niveau de toutes les voix.

module Partition

  ## importation par JSON la structure attendue est la suivante:
  ## section (une par fichier)
  ##  ----- voix
  ##  ----- paramDeVoix

  def self.importer nomFichierJSON
    
    data = JSON.load File.open(nomFichierJSON)
    data.each do |k, v|
      SC.set v, k
    end

  end

  def self.echelle echelle
    SC.listeVoix.each_key do |voix|
      SC.set ({:scale => echelle}), voix
    end
    SC.updateScore
  end


  def self.transpose intervalle
    SC.listeVoix.each_key do |voix|
      SC.set ({:root => intervalle}), voix
    end
    self.updateScore
  end

end

## module pour gérer des marches.


module Marche 
  
  def self.diatonique voixOuMelodie, nbFois, intervalle
    if voixOuMelodie.is_a? String 
      melodie=SC.listeVoix[voixOuMelodie.to_s].degree
      voix=voixOuMelodie
    elsif voixOuMelodie.is_a? Array
      melodie=voixOuMelodie
      voix=rand(50).to_s ## le super truc porkasse !!
    else  
      begin
        raise ArgumentException
        rescue
      end
    end
    tmp= Array.new(nbFois) do |x|
      "Pseq(#{melodie.map { |note| note+intervalle*x }})"
    end
    tmp.delete("\"")
    SC.set ({"degree" => "[#{tmp.join ","}]"}), voix
  end

end

module Rythme

  ## s'occupe du premier chiffre de la propriété "dur", c-à-d la vitesse
  def self.mesure mesure, *voix
    voix.each do |v|
      tmp = SC.listeVoix[v].dur
      tmp[0] = mesure
    SC.set ({ "dur" => tmp }), v
    end
  end
    
  ## s'occupe du deuxième chiffre de la propriété "dur", c-à-d la
  ## gestalt rythmique. 
  
  def self.formule formule, *voix
    voix.each do |v|
      tmp = SC.listeVoix[v].dur
      tmp[1] = formule
      SC.set ({ "dur" => tmp }), v
    end
  end


end
