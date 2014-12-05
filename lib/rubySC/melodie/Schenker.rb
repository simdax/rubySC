
def melodieCachee melUn, melDeux

  i=0  
    tmpDeux=melUn.map {|x| 
      if x == melDeux[i] then i +=1 ; true 
      else false
      end 
    }
    p tmpDeux
  
    if tmpDeux.count(true) == melDeux.size 
    then tmpDeux
    else  nil end
end
