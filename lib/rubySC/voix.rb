# -*- coding: utf-8 -*-
# sorte de classe privée pour garder en mémoire
# ce qui se passe dans les 'voix'...

class Voix

  attr_accessor :information, :dur, :degree, :octave, :marche, :scale, :amp, :instrument, :name

  def initialize nom=nil, options={}

    @information=nil ## cette information sert juste à stocker tout ce
                     ## qui pourrait être utile, principalement dans
                     ## les Marches et autres transformations de
                     ## mélodie. Cette variable ne sert qu'à donner
                     ## une indication

    @name=nom
    if nom.nil?
      puts "choisis un nom"
      nomTmp=gets.chomp
      @name=nomTmp
    end

    SC.listeVoix[@name]=self

    self.setDuree options["dur"]

    if options["degree"].nil?
      then @degree=Array.new(rand(1..5)) do |x| x=rand(12) end
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

    self.setMarche options["marche"]
    SC.updateScore

  end

  def set options
    options.each do |key, value|
      if value.is_a? Symbol
        value=value.to_s
      end
      case key
      when "dur"
        self.setDuree value
      when "marche"
        self.setMarche value
      else
        self.instance_variable_set "@#{key}", value
      end
    end
    SC.updateScore
  end

  def setMarche intervalles
    if intervalles.nil?
      @root=0
    else
      @root="Pstutter(#{self.degree.size}, Pseq(#{intervalles}, inf))"
    end
  end

  def setDuree (duree)

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

  def stop
    SC.stop @name
    @information=nil
  end

  def play
    SC.play @name
    @information="en train de jouer".colorize (:blue)

  end

end
