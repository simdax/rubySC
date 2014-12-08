# sorte de classe privée pour garder en mémoire
# ce qui se passe dans les 'voix'...

class Voix

  def initialize degree:[0],
   scale:"major",
   instrument:"default",
   rythme:nil,
   name:nil,
   dur:nil


   if name.nil?
    p "veuillez entrer un nom pour cette douce voix"
    @name=gets.chomp
  else
   @name=name
 end 

 @information="en pause"
 self.set "degree", degree
 self.set "scale", scale
 self.set "instrument", instrument
 self.set "dur", dur


 SC.listeVoix[@name]=self


end

def set k, v

  case k
  when "dur"
    setDuree v
  when "adsr"
    setADSR v
  when "instrument"
    setInstrument v
  else
   self.instance_variable_set "@#{k}", v
 end 

 SC.updateScore

end

def setADSR atk, dec, sus, rel

  @adsr=[(atk/1.0), (dec/1.0), (sus/1.0), (rel/1.0)]


end

def setInstrument instrument

  if instrument.is_a? Symbol  
    @information = "le sample utilisé actuellement est #{instrument} \n"
    SC.sample instrument.to_s
    @instrument="sampler"
  else
    @instrument=instrument
  end 

end

# C'est une fonction un petit peu compliqué, *
# # car beaucoup de notation pour le rythme est possible
#  * Soit un simple chiffre
#  * Soit un array simple
#  * soit une matrice, avec une découpe "préfaite"

def setDuree (duree)

 if duree.nil?
   @dur=[4, [1]] 
 else

  if duree.is_a? Array

    if duree[0].is_a? Fixnum

      if duree.length == 2 and duree[1].is_a? Array
        @dur=duree 
      elsif duree[0]==0
        @rythme=duree
        @dur=nil
      else
        @dur = [4, duree]  
      end
    end

  elsif duree[0].is_a? Array

    duree.each { |e|
      setDuree e
    }  

  end
end

end

def stop
  SC.stop @name
  @information=nil
end

def play
  SC.updateScore
  SC.play @name
  @information="en train de jouer"
end

end
