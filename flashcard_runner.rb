require './lib/card'
require './lib/deck'

def deck
  @deck
end

def welcome
  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------
"
end

def setup_cards
  cards = [
    Card.new("5", "cinco", :spanish),
    Card.new("1", "uno", :spanish),
    Card.new("What is a walker?", "zombie", :WalkingDead),
    Card.new("What is a Savior?", "thug", :WalkingDead)
  ]

  @deck = Deck.new(cards)
end

setup_cards
welcome
