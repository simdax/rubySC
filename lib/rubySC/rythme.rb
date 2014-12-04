module Rythme

	def funkyser
		
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

end