require 'prime'

class Rythme

  #Les trois représentation possibles d'un rythme
  attr_reader :rythme, :schema, :durees
  
  def initialize 

    @schema=SchemaAccents.new 
    @durees=Durees.new
    self.generer

  end

  def generer
    @rythme=RythmeMesure.new @schema
    @rythme.blabla
  end

  def to_DureeGlobale 
   niouRythme=[]
   niouRythme[0]=0
   (1..@rythme.size).each {|i|
    niouRythme[i]=niouRythme[i-1]+@rythme[i-1]
  } 
  return niouRythme
end

end




class RythmeMesure

  attr_reader :nbMesure, :rythme

  def initialize rythme=nil, nbMesure=nil
    if rythme.is_a? SchemaAccents
      @rythme=rythme.genererSchema
    else 
      @rythme= rythme
    end
    @nbMesure = nbMesure
  end

  def to_grp 
    a=[]
    placeZeros= @rythme.size.times.select {|x| @rythme[x]==0}
    a<<@rythme[0..placeZeros[0]].to_a
    placeZeros.size-1.times do |i|
      i+=1
      a<<@rythme[placeZeros[i-1]..placeZeros[i]].to_a[1..-1]
    end
    return a
  end

  # les règles:
  # chaque groupe a la même durée
  # chaque valeur a la même durée a l'intérieur d'un groupe
  def solfegiser
    tmp=self.to_grp
    tmp.map {
     |e| 
     a=e.size
     e.map { |x| 
      x/a.to_f 
    }
  }

end

def blabla valeur=2.method(:**)
  h=Hash.new
  valeurs=self.solfegiser.flatten.sort.uniq.map.with_index  {|x,i|
    h.store(x,valeur.call(i))
  }  
  @rythme= self.solfegiser.flatten.map{|x|
    h[x]
  }

end

end

# Une classe de Schema se base sur une représentation par niveau d'un rythme
# Le temps le plus fort est le plus bas (==0), et plus la valeur est élevée, 
# moins le temps a d'importance

class SchemaAccents

  def initialize schemaBasique=nil

   @schemaBasique=schemaBasique || [1,1,0]

 end

 def genererSchema nbGrpes:2, niveauOrnement:1, base:@schemaBasique

  tmp=base*nbGrpes
  niveauOrnement.times do 
    tmp=(orner tmp)
  end
  return tmp
end

def orner schema=@schemaBasique

  schema.map! { |e| 
    if e==0
      if (rand 2) == 0
        e=[1,0]
      end
    else
      unless (rand 2) == 0
        e=[e+1,e+1]
      end        
    end
    e
    }.flatten


  end

end




class Durees

  def initialize r=nil
    @rythme=r

  end


  def quantifier niveauPrecision, tpsFort=0

    tailleGrille=@rythme.reduce(&:+)
    tailleFen=tailleGrille.to_f/niveauPrecision

    return @rythme[tpsFort..-1].map { |e|
      if e==0
        then e
      else
        e=tailleFen*(e/tailleFen).round 
      end
    }
  end

  def cbGrp? decoupage=(1..9).to_a

    if decoupage.is_a? Fixnum
      return @rythme.reduce(&:+)%decoupage
    elsif  decoupage.is_a? Array
      decoupage.map.with_index {|e,i| 
        result={decoupage[i] => @rythme.reduce(&:+)%e} 
      }
    else p "error"
    end

  end


  def definirDureeDerniereNote nbMesure=@nbMesure

    if nbMesure.is_a? Fixnum 
     note=self.cbGrp? nbMesure
   elsif nbMesure.is_a? Array
     note=self.cbGrp?(nbMesure).sort_by{|k,v| v}[0]
   else
    p 'error'
  end  

  return note

end


end