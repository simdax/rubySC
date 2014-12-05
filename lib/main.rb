#!/usr/bin/env ruby

require 'Qt4'
require_relative 'qt/form.rb'
require_relative 'rubySC.rb'

marche=true

    a = Qt::Application.new(ARGV)
    u = Ui::Form.new
    w = Qt::Widget.new
    u.setupUi(w)

u.pushButton.connect(SIGNAL :clicked){
	SC.play "melodie1"
}
u.pushButton_2.connect(SIGNAL :clicked){
	SC.stop "melodie1"
}
u.verticalSlider.connect(SIGNAL ('valueChanged(int)')){
	Rythme.tempo (u.verticalSlider.value/100)
}
u.pushButton_3.connect(SIGNAL :clicked) {
	$qApp.quit
}

SC.demarrer
melodie =Melodie.new
melodie.enclencher :piano

w.show
a.exec

