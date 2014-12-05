module Motif

def detectPattern melodie, filtreLongueur=3


  	mel=(convertirABC melodie).join
 

  siz = mel.length
  tmp = []

  (0..siz-1).each do |n|
    (n..siz-1).each do |i|
      tmp << mel[n..i]
    end
  end
  tmp.to_set

	result=Hash.new 
	tmp.each_with_index { |e, i| 
		result[tmp[i]]=(mel.scan /#{tmp[i]}/).size
	 }


	return result.select { |k,v| k.size>=filtreLongueur and v > 1}
	
end

def convertirABC melodie, setChiffres=['c','d','e','f','g','a','b','c']

	toutDansOctave melodie
	return melodie.map { |e|
		e= setChiffres[e]
	}
end

def squeletteMotivique melodie

  	mel=(convertirABC melodie).join
	patterns=detectPattern melodie, 1

	#on met en exergue les plus longs patterns qui se répètent
	patterns=patterns.keys.group_by(&:size).reverse_each { |k,v|
	v.each {|i|
	mel.gsub!(/#{i}/, (k.to_s)*i.size) 
	}
	}

		mel.gsub!(/[^\d]/, '0')
	
	return mel.chars.map(&:to_i)

end


# transforme une melodie reduite autour de quelques valeurs neg et pos
# en une melodie uniquement positive
# RQ : on ne transforme pas 7 en "0" !!
def toutDansOctave grille, modulo=7

return grille.map { |e| 
	if e > modulo and e > 0
	e-(modulo * (e/modulo))
	elsif e < 0 and e > modulo
	(modulo * (e/modulo))-e
	else
	e.abs
	end
}

end

end