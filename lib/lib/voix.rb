# -*- coding: utf-8 -*-
# sorte de classe privée pour garder en mémoire
# ce qui se passe dans les 'voix'...



class Voix
  


  attr_reader :name, :dur, :degree, :octave, :root, :scale, :amp, :instrument
  
  def initialize  name, options={}
 
    if name.nil?
      p "veuillez nommer votre voix"
      raise Error
    end

    @root=nil
    @name=name
    
    if options["dur"].nil?
      then @dur=[1, [1]]
    else
      @dur=options["dur"]
    end
      
    if options["degree"].nil?
      then @degree=Array.new(rand(6)) do |x| x=rand(12) end
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
      then @amp = "Pwhite(0.2,0.5)"
    else
      @amp=options["amp"]
    end

    if options["instrument"].nil?
      then @instrument = "default"
    else
      @instrument=options["instrument"].to_s
    end

    SC.listeVoix[@name]=self

  end
  


  def set options
    options.each do |key, value|
      if value.is_a? Symbol
        self.instance_variable_set "@#{key}", value.to_s
      else
        self.instance_variable_set "@#{key}", value
      end
    end
  end    

 

end
