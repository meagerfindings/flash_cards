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

def start_round
  puts "This is card number 1 out of #{deck.count}."
  puts "Question: #{round.current_card.question}"

  take_a_turn
end

def take_a_turn
  guess_input = gets.chomp
  round.take_turn(guess_input)
  puts round.turns[0].feedback
end

welcome
start_round
