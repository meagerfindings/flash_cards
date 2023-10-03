require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    cards = [
      Card.new("5", "cinco", :spanish),
      Card.new("1", "uno", :spanish),
      Card.new("What is a walker?", "zombie", :WalkingDead)
    ]

    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  context '#count' do
    it 'returns a count' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish),
        Card.new("What is a walker?", "zombie", :WalkingDead)
      ]

      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end
  end

  context '#cards_in_category' do
    it 'returns only the cards in the requested category' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish),
        Card.new("What is a walker?", "zombie", :WalkingDead)
      ]

      filtered_deck = Deck.new(cards).cards_in_category(:spanish)

      expect(filtered_deck.count).to eq(2)
    end
  end
end
