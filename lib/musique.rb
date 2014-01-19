# -*- coding: utf-8 -*-
load 'lib/circularList.rb'
#load 'superCollider.rb'

# fonctions de plus haut niveau


## module utiliser pour faire des choses au niveau de toutes les voix.

module Partition

  def self.echelle echelle
    SC.listeVoix.each_key do |voix|
      SC.set ({:scale => echelle}), voix
    end
    self.updateScore
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

