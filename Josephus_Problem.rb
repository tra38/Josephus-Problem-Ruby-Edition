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
	array.shuffle! #Randomizes the order of the array
	array.each_index { |i| @NumberHash[array[i]] = i+1 } #TODO: Change the i variable to a variable that mean something!
	puts @NumberHash #Shows what "number" each person is assigned
	playgame(array) #Start the game
end

def playgame(array)
	if array.length == 1 #If only one person remains, then the game is over.
		puts "#{array[0]} is the winner! He now can use the horse to leave the area."
	else
		counted = nil #The 'counted' variable is cleared out
		person = array.sample #randomly selects a person to serve as the counter
		puts "#{person} is the new counter. They have Number #{@NumberHash[person]}."
		circle = array.cycle #Creates a "Cycle" enumerator using the array of those people still playing
		(1 + array.index(person)).times { circle.next } #so inelegent, but it's needed to fix "circle.next" correctly.
		@NumberHash[person].times { counted = circle.next } #The counter's number decides how many people the counter, er, "counts"...
		puts "#{counted} had been picked and is out of the game."
		array.delete(counted) #Deletes the loser from the array
		playgame(array) #Keep going until one person remains.
	end
end

setgameup(@test_array)