@test_array = %w[Andrew_Carr
Brian_Fu
Bridget_Cahill
Christine_Hager
Christine_Onayemi
Evangeline_Garreau
Ji_Hyae_Yu
John_Monberg
John_Sternberg
Juan_Carlos_Velasquez
Linas_Mikalcius
Mari_Galicer
Mark_Donald_Amobi
Matt_Greenberg
Michael_Ramuta
Nick_McNeany
Ryan_Lau
Shawn_Wilkinson
Tariq_Ali
Tyler_Pate
]

@NumberHash = {}

#Original Solution
def setgameup(array)
	array.shuffle!
	array.each_index { |i| @NumberHash[array[i]] = i+1 } #change the i variable to a variable that mean something!
	puts @NumberHash
	playgame(array)
end

def playgame(array)
	if array.length == 1
		puts "#{array[0]} is the winner!" 
	else
		counted = nil
		person = array.sample
		puts "#{person} is the new counter. They have Number #{@NumberHash[person]}."
		circle = array.cycle
		(1 + array.index(person)).times { circle.next } #so inelegent, but it's needed to fix "circle.next" correctly.
		@NumberHash[person].times { counted = circle.next }
		puts "#{counted} had been picked and is out of the game."
		array.delete(counted)
		playgame(array)
	end
end #Do I need to have the person count himself when counting? I would say no, because then the guy
#who picked one will lose.

setgameup(@test_array)