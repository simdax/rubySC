# -*- coding: utf-8 -*-

load 'lib/circularList.rb'
require 'json'


## fonctions de plus haut niveau

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
  
  def self.diatonique voix, intervalle, nbFois
    melodie=SC.listeVoix[voix.to_s].degree
    tmp= Array.new(nbFois) do |x|
      "Pseq(#{melodie.map { |note| note+intervalle*x }})"
    end
    tmp.delete("\"")
    SC.set ({:degree => "[#{tmp.join ","}]"}), voix.to_s
  end

end

