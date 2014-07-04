# -*- coding: utf-8 -*-

# -*- coding: utf-8 -*-

require_relative "lib/voix.rb"
require_relative "lib/musique.rb"

require 'active_support'
require 'singleton'
require 'osc-ruby'
require 'osc-ruby/em_server'
include ObjectSpace

## classe principale, singleton
#
# permet de créer des voix, et puis de modifier à la volée chacune
# d'entre elle.  L'intérêt consiste plutôt dans certaines fonctions
# "d'ordre supérieur" qui permet de modifier plusieurs voix ensemble,
# et donc de créer de la logique musicale

class SC


  cattr_reader :listeVoix, :portSuperCollider, :valeurReceptrice
  cattr_accessor :server

  include Singleton

  # ouvre le contact avec SuperCollider

  def self.demarrer

    ## démarre SuperCollider


    if `which sclang` == "" then
      begin
        raise SystemExit
      rescue
        exit
      end
    end
      
    @@server= OSC::EMServer.new 3333


     @@server.add_method "/coucou" do |message|
       p "demande de valeur"
       @@valeurReceptrice=message.to_a
     end
 
    @@server.add_method "/portSC" do |message|
      @@portSuperCollider=message.to_a[0]
    end

#    unless p `ps -ef | grep "sclang" | grep -v "grep" | wc -l`.to_i > 0
    system "sclang  #{File.join(File.dirname(__FILE__), "init.sc")} &"
    Thread.new do @@server.run end
    sleep 1.5
    ## récupèrer l'adresse du port
    @@postMan= OSC::Client.new "localhost", @@portSuperCollider
    
    # variables et méthodes de fin    
    @@listeVoix=Hash.new
    define_finalizer(self, Proc.new {self.quit})

  end


  def self.quit
    `killall sclang scsynth`
  end


  # fonction permettant de communiquer directement avec SuperCollider,
  # ce qui permet pour qui connaît la syntaxe sclang de faire des
  # ajustages directs. À ne pas utiliser normalement.

  def self.send message
    @@postMan.send OSC::Message.new "/SC", message.to_s
  end

   def self.ask valeurRequise, tpsAttente=0.5
     Thread.new do @@server.run end
     self.send %Q[m.sendMsg("/coucou", #{valeurRequise.delete("\"")})]
     sleep tpsAttente
     return @@valeurReceptrice

   end    

  ## fonction semi-privée


  def self.updater voix, arg, value
    case arg
    when "dur"
      self.send "Pbindef (\\#{voix}, \\#{arg}, Pseq(#{value}.convertRhythm, inf))"
    when "degree"
      self.send "Pbindef(\\#{voix}, \\#{arg}, Pseq(#{value}, inf))"
    when "scale"
      self.send "Pbindef(\\#{voix}, \\#{arg}, Scale.#{value})"
    when "instrument"
      self.send "Pbindef(\\#{voix}, \\#{arg}, \\#{value})"
    else
      self.send "Pbindef(\\#{voix}, \\#{arg}, #{value.to_s})"
    end
  end


  def self.updateScore
    @@listeVoix.each do |key, value|
      value.instance_variables.each do |variable|
        self.updater key, variable[0..-1], value.instance_variable_get(variable) unless value.instance_variable_get(variable).nil?
      end
    end
  end

  # fonctions principales 
  
  public
  
  def self.play *args
    if args[0]==:all then
      args=@@listeVoix.keys
    end
    args.each do |voix|
      self.send "Pdef(\\#{voix.to_s}).play"
    end
  end	
  
  def self.stop *args
    if args[0]==:all then
      args=@@listeVoix.keys
    end
    args.each do |voix|
      self.send "Pdef(\\#{voix}).stop"
    end
  end

  def self.remove *args
    if args[0]==:all then
      args=@@listeVoix.keys
    end
    args.each do |voix|
      self.stop voix
      @@listeVoix.delete voix
    end
  end
  
end

SC.demarrer
