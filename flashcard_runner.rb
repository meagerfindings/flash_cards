require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card'
require './lib/turn'



def deck
  @deck ||= Deck.new([
    Card.new("5", "cinco", :spanish),
    Card.new("1", "uno", :spanish),
    Card.new("What is a walker?", "zombie", :WalkingDead),
    Card.new("What is a Savior?", "thug", :WalkingDead)
  ])
end

def round
  @round ||= Round.new(deck)
end

def welcome
  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------
"
end

def turn_number
  round.turns.count + 1
end

def take_turns
  puts "This is card number #{turn_number} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"

  guess_input = gets.chomp
  round.take_turn(guess_input)

  puts round.turns.last.feedback

  take_turns if turn_number <= deck.count
end

def closing
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%"

  category_stats
end

def category_stats
  categories = deck.find_categories
  categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
  end
end

welcome
take_turns
closing
