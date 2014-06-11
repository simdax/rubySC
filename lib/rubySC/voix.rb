# -*- coding: utf-8 -*-
# sorte de classe privée pour garder en mémoire
# ce qui se passe dans les 'voix'...

class Voix

  attr_reader :dur, :degree, :octave, :root, :scale, :amp, :instrument
  attr_accessor :information
  
  def initialize options={}
    
    @information=nil ## cette information sert juste à stocker tout ce
                     ## qui pourrait être utile, principalement dans
                     ## les Marches et autres transformations de
                     ## mélodie. Cette variable ne sert qu'à donner
                     ## une indication


 
    self.setDuree options["dur"]
    
    if options["degree"].nil?
      then @degree=Array.new(rand(1..20)) do |x| x=rand(12) end
    else
      @degree=options["degree"]
    end
    
    if options["octave"].nil?
      then @octave=4
    else
      @octave=options["octave"]
    end


    if options["scale"].nil?
      then @scale = "major"
    else
      @scale=options["scale"]
    end

    if options["amp"].nil?
      then @amp = "Pwhite(0.2,0.8)"
    else
      @amp=options["amp"]
    end

    if options["instrument"].nil?
      then @instrument = "default"
    else
      @instrument=options["instrument"].to_s
    end

    self.setRoot options["root"]

  end
  
  def set options
    options.each do |key, value|
      if value.is_a? Symbol
        value=value.to_s
      end
      
      case key
      when "dur"
        self.setDuree value
      when "root"
        self.setRoot value
      else
        self.instance_variable_set "@#{key}", value
      end
    end
  end
  
  def setRoot intervalles
    if intervalles.nil?
      @root=0
    else
      @root="Pstutter(#{self.degree.size}, Pseq(#{intervalles}, inf))"
    end
  end
  
  def setDuree duree
    if duree.nil?
      then @dur=[4, [1]] ## valeur de base, tout en ronde, cantus
                         ## firmus style, io!
    else
      if duree.is_a? Array 
        if duree.length == 2 and duree[1].is_a? Array
          then
          @dur=duree ## quelqu'un a fait un vrai objet en RTM notation
        else
          tmp = true 
          duree.each {
            |x|
            unless x.is_a? Fixnum
              tmp = false
            end
          }
          if tmp then
            @dur = [4, duree]  ## on a juste mis un rythme pour la
                               ## durée d'une mesure
          else
            begin 
              raise ArgumentError
            rescue "mauvais argument pour la durée"
            end
          end
        end
      end
    end
  end
  
end

