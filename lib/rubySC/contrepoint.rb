def basiqueOne

a = Voix.new "cantusFirmus"
b = Voix.new "organum"

l= lambda { |x, y|
tmp=harmoniser x.degree, [-2,2,4]
y.set ({ :degree=> tmp })
}

Thread
20.times do
l.call a, b
sleep 2
l.call b, a
end


end
