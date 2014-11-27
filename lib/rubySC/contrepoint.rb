def bicinium consonances=[-2,2]

a = Voix.new "cantusFirmus"
b = Voix.new "organum"

a.degree=creerMelodie
a.play ; b.play

l= lambda { |x, y|
tmp=harmoniser x.degree, consonances
y.set ({ :degree=> tmp })
}

Thread.new do
20.times do
l.call a, b
sleep 2
l.call b, a
end
end


end

def organum voix

a= Voix.new "harmonisationDe"+voix.name

a.degree= harmoniser voix.degree, [2]

end
