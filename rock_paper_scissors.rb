# Initialze all the variables needed for the program
rps_array = ["Rock","Paper","Scissors"]
user_input = ""
score = {computer:0, user:0}
round = 0
play = true
play_again= ""

puts "Lets play a Best of Three game of Rocks, Paper, Scissors!"
while play

	# This while loop will check if either the computer or user reached a score of 2 victories, otherwise keep looping
	while score[:computer] < 2 && score[:user] < 2
		puts "Select Rock, Paper, Scissors, GO!"
		user_input = gets.chomp.downcase.capitalize

		until rps_array.include? user_input
			puts "Please Pick Rock, Paper, Scissors"
			user_input = gets.chomp.downcase.capitalize
		end

		computer_input = rps_array.sample
		round +=1

		if computer_input == user_input
			puts "You chose #{user_input}, and the computer chose #{computer_input}, It's a Tie!"
			puts "The score in Round #{round} is You: #{score[:user]},  the computer: #{score[:computer]}"
		elsif (user_input == "Rock" && computer_input == "Scissors") || (user_input == "Paper" && computer_input == "Rock") || (user_input == "Scissors" && computer_input=="Paper")
			puts "You chose #{user_input}, and the computer chose #{computer_input}, You WIN :) this round!"
			score[:user] +=1 
			puts "The score in Round #{round} is You: #{score[:user]},  the computer: #{score[:computer]}"		
		else 
			puts "You chose #{user_input}, and the computer chose #{computer_input}, You LOSE :( this round!"
			score[:computer] +=1 
			puts "The score in Round #{round} is You: #{score[:user]},  the computer: #{score[:computer]}"				
		end
	end

	# This loop keeps asking the user to play the game again or not	
	until ["Yes","No"].include? play_again
		puts "Do you want to play again: Yes or No"
		play_again = gets.chomp.downcase.capitalize
		if play_again == "Yes" 
			user_input = ""
			score = {computer:0, user:0}
			round = 0
			play = true
			puts "Ok, Let's Play again!"
		else
			play = false
			puts "OK, Good Bye!"
		end
	end
	play_again = ""
end