#! /usr/bin/ruby
# -*- coding: utf-8 -*-

require 'osc-ruby'
#require 'osc-ruby/em_server'
require 'singleton'
include ObjectSpace
load "#{File.join(File.dirname(__FILE__), "voix.rb")}"


## classe principale, singleton
#
# permet de créer des voix, et puis de modifier à la volée chacune
# d'entre elle.  L'intérêt consiste plutôt dans certaines fonctions
# "d'ordre supérieur" qui permet de modifier plusieurs voix ensemble,
# et donc de créer de la logique musicale

class Musique

  include Singleton

  # ouvre le contact avec SuperCollider

  def initialize

    ## démarre SuperCollider

    unless p `ps -ef | grep "sclang" | grep -v "grep" | wc -l`.to_i > 0
      system "sclang -u 57320 #{File.join(File.dirname(__FILE__), "init.sc")} &"
    end

    ## récupère l'adresse du port, mais la lib ne marche pas ??
    
    # @server= OSC::EMServer.new 3333
    # @server.add_method '/portSuperCollider' do |message|
    #   @portSuperCollider=message.message
    # end
    @postMan= OSC::Client.new "localhost", 57320 ## @portSuperCollider

    # variables et méthodes d'utilisation
    
    @listeVoix=Hash.new
    define_finalizer(self, Proc.new {self.quit})
    
  end

  def quit
    `killall scsynth sclang`
  end


  # fonction permettant de communiquer directement avec SuperCollider,
  # ce qui permet pour qui connaît la syntaxe sclang de faire des
  # ajustages directs

  def send message
    @postMan.send OSC::Message.new "/SC", message.to_s
  end

  
  def updateScore
    @listeVoix.each do |key, value|
      value.instance_variables.each do |variable|
        self.updater key, variable[1..-1], value.instance_variable_get(variable) unless value.instance_variable_get(variable).nil?
      end
    end
  end

  def updater voix, arg, value
    if voix.is_a? String then
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
        self.send "Pbindef(\\#{voix}, \\#{arg}, #{value})"
      end
    end
  end

  # fonctions principales 
  
  def set voix, options={}
    if voix==:all then
      begin 
        raise 'ArgumentError : vous ne pouvez appeler une voix "all", renommez-la'
      rescue
        gets voix
      end
    elsif @listeVoix[voix.to_s].nil? then
      @listeVoix[voix.to_s]=Voix.new options
    else
      @listeVoix[voix.to_s].set options
    end
    self.updateScore   
    self.play voix.to_s
  end
  
  def remove *args
    if args[0]==:all then
      args=@listeVoix.keys
    end
    args.each do |voix|
      @listeVoix.delete args
    end
  end

  def play *args
    if args[0]==:all then
      args=@listeVoix.keys
    end
    args.each do |voix|
      self.send "Pdef(\\#{voix.to_s}).play"
    end
  end	
  
  def stop *args
    if args[0]==:all then
      args=@listeVoix.keys
    end
    args.each do |voix|
      self.send "Pdef(\\#{voix}).stop"
    end
  end
  
  ### fonction Live Coding
  
  def list
    @listeVoix.each do |k, v|
      puts "#{k} : #{v.inspect}"
    end
  end


  # fonctions de très haut niveau

  def echelle echelle
    @listeVoix.each_key do |voix|
      self.set voix, {:scale => echelle}
    end
    self.updateScore
  end
  
  def grilleAccords

  end

end
