def deuxVoix

	a=Voix.new "voixUne", ({"degree"=> creerMelodie, "instrument" => "sax"})
	b=Voix.new "voixDeux"
	b.degree = harmoniser a.degree

	SC.updateScore
	SC.play

end	