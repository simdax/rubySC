require_relative "algos.rb"

class Melodie

include Intervalles

attr_reader :dessinRythmique, :dessinMelodique

def initialize
  @dessinMelodique = creerMelodie
  @dessinRythmique = creerRythme @dessinMelodique
  @@nbMel=0
end
  
  def mettreVoix instrument="default"
    p "instrument sera #{instrument}"
    @@nbMel+=1
    Voix.new "melodie#{@@nbMel}", 
    ({:instrument => instrument, 
      :degree => @dessinMelodique,
      :dur => @dessinRythmique})
  end

#quelques raccourcis

def interMel 
  intervallesMel @dessinMelodique
end

def interAbs
  intervallesAbs @dessinMelodique
end

def interRel note=0
  intervallesMel @dessinMelodique, note
end

def doublon
  detecterDoublons @dessinMelodique
end

end



def creerMelodie nbNote=rand(10..30)

  Array.new (nbNote) do |note|
    note=[0,0,1,1,2,3,3,3,3,4,4,4,4,5,6].sample   #manière un peu bourrine de "pondérer" les notes possibles
  end
end

def transpose melodie, deCombien
    melodie.map { |e| e+= deCombien }
end

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

#grand moment de désarroi algorithmique

# def creerMelodie squeletteRythmique, urMelodie=["c","b","a","g","f","e","d","c"]


# squeletteRythmique.last=3 #déjà ça c'est réglé
# squeletteRythmique.reverse!

# melodie=[]

# notePrincipale
# noteSecondaire
# noteOrnementale


# UnVersUn = lambda { noteOrnementale+=1}
# UnVersDeux = lambda { |a| orner squeletteRythmique(a.index-noteOrnementale) }
# UnVersTrois
# DeuxversUn
# DeuxVersDeux
# DeuxVersTrois
# TroisVersUn
# TRoisVersDeux
# TroisVErsTRois

# niveauUn=squeletteRythmique.each_cons(2) { |a,b|
#   case b
#     when 1
#       case a
#         when 1
#           UnVersUn.call
#         when 2
#           UnVersDeux.call
#         when 3
#           UnVersTrois.call
#         end
#     when 2
#       case a
#         when 1
#           DeuxVersUn.call
#         when 2
#           DeuxVersDeux.call
#         when 3
#           DeuxVersTrois.call
#         end
#     when 3
#     case a
#         when 1
#           TroisVersUn.call
#         when 2
#           TroisVersDeux.call
#         when 3
#           TroisVersTrois.call
#   end



# melodie.reverse!


# end

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



#analyse rythmique basique
# si intervalle grand => pt d'appui
# si note conjointes et/ou similaire => plus rapide
#pour l'instant, pas de note d'approche


def creerRythme melodie=nil  #analyse

  if melodie.nil?
  return  RubySC_CONST::Rythmes.sample
  end

  rythme = intervallesMel melodie
  rythme.map! { |inter|
    case inter.abs
      when 1
      note = 1

    else
      note=2
    end
  }
  rythme << 4

end

