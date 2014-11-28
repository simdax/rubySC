def consonnancesPossibles consonnances, noteM, noteH, ecartMax


tmp=consonnances.reject	{|x|
((noteM+x) - noteH).abs > ecartMax
} 
p tmp

if tmp==[] then
	tmp=consonnancesPossibles consonnances, noteM, noteH, ecartMax+1
end	

return tmp
end


def harmoniser melodie, consonnances, ecartMax=2

	harmo=Array.new (melodie.size) 
	harmo[0]=melodie[0]+consonnances.sample
	harmo[1..-1].map.with_index(1) {  |a,i| 		
		harmo[i]=melodie[i]+(consonnancesPossibles consonnances, melodie[i], harmo[i-1], ecartMax).sample 
	}

	p "mel = #{melodie}"
	p "harmo = #{harmo}"
	
end



def bicinium consonances=[-2,2]

a = Voix.new "cantusFirmus"
b = Voix.new "organum"

a.degree=creerMelodie
a.play ; b.play

l= lambda { |x, y|
tmp=harmoniser x.degree, consonances
y.set ({ "degree"=> tmp })
}

Thread.new do
20.times do
l.call a, b
sleep 2
l.call b, a
end
end


end

def organum voix, typeHarmonisation=[-2,0,2,4]

a= Voix.new "harmonisationDe"+voix.name

a.degree= harmoniser voix.degree, typeHarmonisation
a.setDuree voix.dur

SC.updateScore
end
