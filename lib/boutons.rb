class App

include Helper #pour m = SC.listeVoix[melodie1"]
attr_reader :mel

def initialize widget


	SC.demarrer

	@w=widget
	@mel=Melodie.new
	@v=Voix.new name:"melodie1"
	@mel.voix "melodie1"


	self.boutons 
	self.sliders 
	self.instrument 
end

def	boutons
	@w.pushButton.connect(SIGNAL :clicked){
		SC.play "melodie1"
	}
	@w.pushButton_2.connect(SIGNAL :clicked){
		SC.stop "melodie1"
	}
	@w.pushButton_3.connect(SIGNAL :clicked) {
		$qApp.quit
	}
	@w.pushButton_4.connect(SIGNAL :clicked) {
		@mel.creerMelodieAlea
		@mel.voix "melodie1"
	}
	@w.pushButton_5.connect(SIGNAL :clicked) {
		# @mel.creerRythme ({ :intervalles => @w.verticalSlider.value, 
		# 	:motifs => @w.verticalSlider_2.value})
		@mel.genererRythme
		@mel.voix "melodie1"
	}
end

def sliders 
	@w.horizontalSlider.connect(SIGNAL ('valueChanged(int)')){
		Const_Rythme::tempo (@w.horizontalSlider.value/50.0)
	}

end

def instrument 
	@w.textEdit.connect(SIGNAL (:textChanged)){
		sleep 0.5 #pour attendre d'avoir fini de taper
		@v.set "instrument", @w.textEdit.toPlainText
	}
end

end