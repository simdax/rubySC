#!/usr/bin/env ruby

require 'Qt4'
require 'pp'
require_relative 'qt/form.rb'
require_relative 'rubySC.rb'
require_relative 'boutons.rb'


	a = Qt::Application.new(ARGV)
	u = Ui::Form.new
	w = Qt::Widget.new
	u.setupUi(w)
	app=App.new u

Thread.new {
	loop do
	system 'clear'
	pp SC.listeVoix
	pp app.mel
	sleep 0.5
end
}

	w.show
	a.exec
