require_relative '../melodie/intervalles.rb'

module VoiceLeading
include Intervalles

	@@position = [[2,4], [2, 5],[3,5]]
		#ALLLLLLLLLLLEZ
	

	#DoubleArray de Hash. Selon la position (place dans l'array),
	#puis selon le vecteur (de -3 a 3) on a une position et éventuellement
	#un changement de basse

	chgtPos = [
		[[2,-1],[1,0],[0,-1],nil,[0,+1],[1,-1],[2,+0]],
		[[2,-1],[2,+0],[2,+1],nil,[1,+1],[0,0],[0,+1]],
		[[0,0],[0,+1],[2,-1],nil,[2,+1],[1,+0],[1,+1]]
	]

	@@matricePos=[]
	3.times do |j|
		@@matricePos[j]=
	h=Hash.new 
	(-3..3).each do |i|
		h[i]=chgtPos[j][i+3]
		end
	end


#VOICE_LEAD_POS=[[0,2,4], [0, 2, 5],[0,3,5]]

#réduit la grille d'accords autour d'une oscillation entre -3 et 3
#pour faire en tout 7 valeurs possibles, aka le nombre de notes dans la 
#gamme diatonique

def reduireGrille grille, grilleAnalyse=7
	minMax = grilleAnalyse/2
	(intervalles grille).map { |e| 
	e=e%grilleAnalyse
	if e > minMax
	e=-(grilleAnalyse%e)
	elsif e < -minMax
 	e=(grilleAnalyse%e).abs 
 	else e
    end
	}
end


def incrementer accord, vecteurHarmonique

#	binding.pry
	position_basse=@@matricePos[(detectPosition accord)][vecteurHarmonique]
	
	accordNv=[]
	if position_basse.nil?
		accordNv=accord
	else
	accordNv[0]=accord[0]+position_basse[1]
	accordNv[1]=accordNv[0]+@@position[position_basse[0]][0]
	accordNv[2]=accordNv[0]+@@position[position_basse[0]][1]
	end
	return accordNv
end

def detectPosition array
	tmp=[]
	tmp<< array[1]-array[0]
	tmp<< array[2]-array[0]
	case tmp
		when [2,4] 
			return 0
		when [2,5] 
			return 1
		when [3,5] 
			return 2
	end
end

# implémente selon le "vecteur harmonique" le passage d'un accord à un autre

# def incrementer accord, vecteurHarmonique

# plus=lambda{|x| x+1}
# moins= lambda{|x| x-1}

# 	case vecteurHarmonique
# 	when 0
# 		return accord
# 	when 1 	
# 		return accord.map! {|x| plus.call x}
# 	when -1
# 		return accord.map! {|x| moins.call x}	
# 	when 2
# 		accord[0]-=1
# 		return accord
# 	when -2
# 		accord[-1]+=1
# 		return accord
# 	when 3	
# 		accord[-1]+=1
# 		accord[-2]+=1
# 		return accord
# 	when -3 
# 		accord[0]-=1
# 		accord[1]-=1
# 		return accord
# 	end	
# end


def accordBasique basse, position=nbNotes=3, intervalleBase=2 
	
	tmp=[]
	nbNotes.times do |x|
		tmp << basse+intervalleBase*x
	end
	return tmp
end

def dispatchNotes accord
	tmp=[]
	accord.each { |e| 
	tmp << [e] }
	return tmp
end

 end