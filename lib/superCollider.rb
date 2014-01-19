#! /usr/bin/ruby
# -*- coding: utf-8 -*-

load "#{File.join(File.dirname(__FILE__), "voix.rb")}"
load "#{File.join(File.dirname(__FILE__), "musique.rb")}"

require 'active_support'
require 'osc-ruby'
#require 'osc-ruby/em_server'
require 'singleton'
include ObjectSpace



## classe principale, singleton
#
# permet de créer des voix, et puis de modifier à la volée chacune
# d'entre elle.  L'intérêt consiste plutôt dans certaines fonctions
# "d'ordre supérieur" qui permet de modifier plusieurs voix ensemble,
# et donc de créer de la logique musicale

class SC

  cattr_reader :listeVoix
  include Partition, Marche

  # ouvre le contact avec SuperCollider

  def self.demarrer

    ## démarre SuperCollider
    #TODO : faire quelque chose d'un peu plus propre

    unless p `ps -ef | grep "sclang" | grep -v "grep" | wc -l`.to_i > 0
      system "sclang -u 57320 #{File.join(File.dirname(__FILE__), "init.sc")} &"
    end

    ##  TODO : En théorie, récupèrer l'adresse du port, surtout si une autre instance de
    ## SuperCollider existe...
    
    # @server= OSC::EMServer.new 3333
    # @server.add_method '/portSuperCollider' do |message|
    #   @portSuperCollider=message.message
    # end
    @postMan= OSC::Client.new "localhost", 57320 ## @portSuperCollider

    # variables et méthodes d'utilisation
    
    @@listeVoix=Hash.new
    define_finalizer(self, Proc.new {self.quit})
    
  end

  ##TODO : trouver une manuère plus propre de quitter SuperCollider,
  ##Jack a toujours l'air de se vexer...
  def self.quit
    `killall scsynth sclang`
  end


  # fonction permettant de communiquer directement avec SuperCollider,
  # ce qui permet pour qui connaît la syntaxe sclang de faire des
  # ajustages directs. À ne pas utiliser normalement.

  def self.send message
    @postMan.send OSC::Message.new "/SC", message.to_s
  end

  ## fonction semi-privée

  def self.updateScore
    @@listeVoix.each do |key, value|
      value.instance_variables.each do |variable|
        self.updater key, variable[1..-1], value.instance_variable_get(variable) unless value.instance_variable_get(variable).nil?
      end
    end
  end

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

  # fonctions principales 
  
  public
  
  def self.set options={}, *voix
    if voix.nil?
      begin
        raise ArgumentError
      rescue
        puts "vous devez donner un nom à votre (vos) voix"
      end
    end
    voix.each do |voix|
      p voix.to_s
      if voix==:all then
        begin 
          raise ArgumentError 
        rescue
          puts " vous ne pouvez appeler une voix \"all\", renommez-la'"
        end
      elsif @@listeVoix[voix.to_s].nil? then
        @@listeVoix[voix.to_s]=Voix.new options
      else
        @@listeVoix[voix.to_s].set options
      end
      self.updateScore   
      self.play voix.to_s
    end
  end
    

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
