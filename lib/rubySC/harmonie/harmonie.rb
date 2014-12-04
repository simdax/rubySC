module Harmonie

include Intervalles

	def squeletteHarmonique mel, set=[0,2,4]

		mel.map { |e| 
		set.any? {|x| e==x} ? true : false }
	end

	# Sert à détecter les notes paires dans une section de
	#mélodie. Retourne la distance qui sépare ces notes
	#typiquement, un accord parfait sera {"0 (ou 1)" => [0,1,2]}
	# @format melodie [Melodie]
	
	def detecterHarmonies mel, intervalles=2

		tmpUn=mel.sort.uniq.map { |e|
			e%intervalles
		}
		tmpDeux=mel.sort.uniq.map { |e|
			e/intervalles
		}
		n={}
		tmpUn.size.times do |x|
			n[tmpUn[x].to_s].nil? ? \
			(n[tmpUn[x].to_s] = [] << tmpDeux[x]) :\
			(n[tmpUn[x].to_s] << tmpDeux[x])
		end
		return n
	end


	def analyse mel, grilleAnalyse=2, modulo=7

		mel.each_slice(grilleAnalyse).map { |x|
		 	(x[-1]-x[0])%7
		  }
			
	end

# Je ne sais pas si cette fonction a du sens, vraiment
	def analyseReduction mel, nbRecursion=mel.size-1, tmp=[]

		tmp << mel
		unless nbRecursion<1
		analyseReduction (mel.each_cons(2).map { |x|
		 	(x[-1]-x[0])
		}), nbRecursion-=1, tmp
		end
		return tmp
	end


end