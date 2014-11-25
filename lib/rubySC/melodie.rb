def creerMelodie

  Array.new (5) do |note|
    note=[0,1,2,4,5].sample
  end

end

def harmoniser melodie, consonnances

  harmonisation= melodie.map do |note|
    note+=consonnances.sample
  end

end
