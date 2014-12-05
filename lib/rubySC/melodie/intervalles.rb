module Intervalles

def intervalles melodie

  tmp=melodie.each_with_index.map{ |a, i|
    if melodie[i+1]
    then melodie[i+1]-a
    end
    }
  	tmp[0..-2]

end

def intervallesBoucle melodie

	intervallesMel melodie << melodie[0]-melodie[-1]
	
end

def intervallesAbs melodie

	(intervallesMel melodie).map { :abs  }
	
end

def intervallesRel melodie, note=0

	ptDepart = melodie[note]
	return melodie.map { |x| 
		x-= ptDepart }
end

def squeletteIntervallique melodie, gdIntervalle=5, petitInter=1

	i=intervalles melodie
	i.map! { |e| 
	 if e<=petitInter
	 	e=0
	 elsif
	 	e>=gdIntervalle
	 	e=2
	 else
	 	e=1
	 end
	}

end

end