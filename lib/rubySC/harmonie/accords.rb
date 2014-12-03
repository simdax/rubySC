#simplement un ensemble de voix marchant en simultanée
# mais selon une logique harmonique => une basse !

class Accords
include VoiceLeading

attr_accessor :grille

	def initialize grille:, nbVoix:3, rythmeHarmonique:nil
		@basse=grille
		@realisation=Array.new(nbVoix) { |i| i=[]  }
		@rythmeHarmonique=rythmeHarmonique
		self.realiserAccords
	end

	def play 
		3.times do |i|
		Voix.new "harmo#{i}", {:instrument =>"default",
								   :degree => @realisation[i],
								   :dur => @rythmeHarmonique}
		end
		Voix.new "basse", {:instrument => "fatsaw", 
						   :degree =>@basse,
						   :dur => @rythmeHarmonique}
		#if jouer? ? SC.play : nil
	end
	

private def foutreDansReal truc #bon j'en ai marre, OK ?
	tmp=dispatchNotes truc 
	truc.size.times do |i|	
	@realisation[i] << truc [i]
	end	
end

	def realiserAccords
		tmp=accordBasique @basse[0]
		foutreDansReal tmp
		grille=reduireGrille @basse
		p grille
		grille.each { |e| 
		tmp=incrementer tmp, e
		p tmp
		foutreDansReal tmp }
	end
end
