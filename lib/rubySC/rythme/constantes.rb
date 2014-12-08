
module Const_Rythme


  ## Je n'ai mis que les rythmes qui me semblaient
  ## les plus connus
  Rythmes = []

  ## Rythmes à 3 notes
  Rythmes <<  Pavanne=[2,1,1]
  Rythmes << Syncopette=[1,2,1]

  Rythmes << Sicilienne=[3,1,2]
  Rythmes << Chabada=[3,2,1]

  Rythmes << Tresillo=[3,3,2]


  def funkyser

		#replace [cll] par betedecll
	end
	
  def calculDernierTemps formuleRythmique, nbMesure=4

   tmp=formuleRythmique.reduce(&:+)
   lastValue=0
   if tmp%nbMesure !=0
    until tmp%nbMesure==0
     lastValue+=1
     tmp+=lastValue
   end
 end
 return formuleRythmique << lastValue
end


def creerRythme melodie=nil  #analyse

  if melodie.nil?
    return  RubySC_CONST::Rythmes.sample
  end

  rythme = intervallesMel melodie
  rythme.map! { |inter|
    case inter.abs
    when 1
      note = 1

    else
      note=2
    end
  }
  rythme << 4

end


def self.tempo vitesse
  SC.send "TempoClock.default.tempo = #{vitesse}"
end

  ## s'occupe du premier chiffre de la propriété "dur", c-à-d la vitesse
  def self.mesure mesure, *voix
    voix.each do |v|
      tmp = SC.listeVoix[v.to_s].dur
      tmp[0] = mesure
      SC.set true, ({ "dur" => tmp }), v
    end
  end

  ## s'occupe du deuxième chiffre de la propriété "dur", c-à-d la
  ## gestalt rythmique.

  def self.formule formule, *voix
    voix.each do |v|
      tmp = SC.listeVoix[v.to_s].dur
      tmp[1] = formule
      SC.set true, ({ "dur" => tmp }), v
    end
  end
  
end