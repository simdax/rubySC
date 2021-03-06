require_relative 'intervalles.rb'
require_relative  'motif.rb'

class Melodie

  include Intervalles
  include Motif

  attr_reader :dessinRythmique, :dessinMelodique, :analyse
  attr_accessor :rythme

  def initialize

    @analyse={}

    self.creerMelodieAlea
    self.analyserMel
    self.creerRythme

    @rythme=Rythme.new

  end

  def voix voix

    SC.listeVoix[voix].set "degree", @dessinMelodique
    SC.listeVoix[voix].set  "dur" , self.getR
    SC.updateScore
  end

  def analyserMel

    @analyse["motifs"]=squeletteMotivique @dessinMelodique
    @analyse["intervalles"]=squeletteIntervallique @dessinMelodique

  end   

  def genererRythme

    @rythme.generer
    
  end
  def getR

    @rythme.rythme.rythme #oui, c'est chelou
    
  end
  def creerRythme options={:intervalles=>1, :motifs=>1} 

    tmp=[]
    l=lambda {|x|
      unless options[x].nil? 
        tmp<<@analyse[x.to_s].map(&options[x].method(:*))
      end
    }

    options.each { |k,v|
      l.call k  }

      result=[]
      (@dessinMelodique.size-1).times do |i|
        result << tmp.map{ |x| x[i] }.reduce(&:+)
      end

      @dessinRythmique= result

    end


    def creerMelodieAlea nbNote=rand(5..9)

      @dessinMelodique= 
      Array.new (nbNote) do |note|
    note=[0,0,1,1,2,3,3,3,3,4,4,4,4,5,6].sample   #manière un peu bourrine de "pondérer" les notes possibles
  end
end


def creerMelodie

end

def vitesse

end


#quelques raccourcis

def inter
  intervalles @dessinMelodique
end

def interAbs
  intervallesAbs @dessinMelodique
end

def interRel note=0
  intervallesMel @dessinMelodique, note
end


def detectDoublons 
  @dessinMelodique.map.with_index(1) { |e, i| 
    unless i==@dessinMelodique.size
      @dessinMelodique[i] - @dessinMelodique[i-1] == 0 ? true : false
    end }[0..-2]
  end


end



def transpose melodie, deCombien
  melodie.map { |e| e+= deCombien }
end


def rejoindre noteDepart, noteArrivee, nbTemps

  intervalle=(noteArrivee-noteDepart).abs
  if intervalle == nbTemps then
    p'jkl'
    tmp =(Range.new noteDepart+1, noteArrivee-1).to_a
  else
    p'hj'
    tmp=[]  
    nbTemps.times { |x|
      tmp<<noteDepart+2*(x+1)
    }
  end
  return tmp
end


def orner note, nbNote

  appogiature = lambda { tmp=[note+1, note] }
  mordant = lambda { tmp=[note, note-1, note] }
  trille = lambda { tmp= [note-1, note, note+1, note] }

  case nbNote
  when 0
    return note
  when 1
   return appogiature.call
 when 2
   return  mordant.call
 when 3
   return  trille.call
 end
 if nbNote > 3 
  p "erreur !"
end

end
