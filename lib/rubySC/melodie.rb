def creerMelodie nbNote=rand(4..12)

  Array.new (nbNote) do |note|
    note=[0,0,1,2,3,3,4,4,5,6].sample
  end
end

#analyse rythmique basique
# si intervalle grand => pt d'appui
# si note conjointes et/ou similaire => plus rapide
#pour l'instant, pas de note d'approche

def intervallesMel melodie

  tmp=melodie.each_with_index.map{ |a, i|
    if melodie[i+1]
    then melodie[i+1]-a
    end
    }
  tmp[0..-2]

end

def creerRythme melodie  #analyse

  rythme = intervallesMel melodie
  rythme.map { |inter|
    if inter.abs>1
      note= 2
    else
      note=1
    end
  }
  rythme << 3

end

def harmoniser melodie, consonnances

  harmonisation= melodie.map do |note|
    note+=consonnances.sample
  end

end
