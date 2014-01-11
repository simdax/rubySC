# -*- coding: utf-8 -*-
# sorte de classe privée un peu inutile pour garder en mémoire
# ce qui se passe dans les 'voix'...

class Voix
  
  def initialize options={}
   
    if options[:scale].nil?
      then @scale = "major"
    else @scale=options[:scale]
    end
    @dur=options[:dur]
    @degree=options[:degree]
    @octave=options[:octave]
    @amp=options[:amp]
    if options[:instrument].nil?
      then @instrument = "default"
    else @instrument=options[:instrument].to_s
    end
  end
  
  # permet de set plein d'options à la fois, ce qui est plutôt cool
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
