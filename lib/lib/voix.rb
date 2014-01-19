# -*- coding: utf-8 -*-
# sorte de classe privée pour garder en mémoire
# ce qui se passe dans les 'voix'...

class Voix

  attr_reader :dur, :degree, :octave, :root, :scale, :amp, :instrument
  
  def initialize options={}
   
    @dur=options["dur"]
    @degree=options["degree"]
    @octave=options["octave"]
    @root=options["root"]

    if options["scale"].nil?
      then @scale = "major"
    else @scale=options["scale"]
    end

    if options["amp"].nil?
      then @amp = "Pwhite(0.2,0.5)"
    else @amp=options["amp"]
    end

    if options["instrument"].nil?
      then @instrument = "default"
    else @instrument=options["instrument"].to_s
    end

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
