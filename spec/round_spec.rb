require './lib/round'

RSpec.describe Round do
  it 'exists' do
    cards = [
      Card.new("5", "cinco", :spanish),
      Card.new("1", "uno", :spanish),
      Card.new("What is a walker?", "zombie", :WalkingDead)
    ]

    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  context '#take_turn' do
    it 'returns array of turns' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish),
        Card.new("What is a walker?", "zombie", :WalkingDead)
      ]

      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("cinco")
      expect(round.turns[0]).to be_instance_of(Turn)
    end
  end

  context '#current_card' do
    it 'returns first card before first turn' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish),
        Card.new("What is a walker?", "zombie", :WalkingDead)
      ]

      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.current_card).to eq(cards[0])
    end
  end

  context '#number_correct' do
    it 'returns number of correct cards' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish),
        Card.new("What is a walker?", "zombie", :WalkingDead)
      ]

      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("cinco")
      round.take_turn("uno")
      round.take_turn("sleeper")

      expect(round.number_correct).to eq(2)
    end
  end

  context '#number_correct_by_category' do
    it 'returns number of correct cards per category' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish),
        Card.new("What is a walker?", "zombie", :WalkingDead),
        Card.new("What is a Savior?", "thug", :WalkingDead)
      ]

      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("cinco")
      round.take_turn("sugar")
      round.take_turn("zombie")
      round.take_turn("thug")

      expect(round.number_correct_by_category(:WalkingDead)).to eq(2)
    end
  end

  context '#percent_correct' do
    it 'returns percent correct' do
      cards = [
        Card.new("5", "cinco", :spanish),
        Card.new("1", "uno", :spanish)
      ]

      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("cinco")
      round.take_turn("sugar")

      expect(round.percent_correct).to eq(50.0)
    end
  end
  context '#percent_correct_by_category' do
    it 'returns percent correct per category' do
        cards = [
          Card.new("5", "cinco", :spanish),
          Card.new("1", "uno", :spanish),
          Card.new("What is a walker?", "zombie", :WalkingDead),
          Card.new("What is a Savior?", "thug", :WalkingDead)
        ]

        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn("cinco")
        round.take_turn("sugar")
        round.take_turn("zombie")
        round.take_turn("thug")

        expect(round.percent_correct_by_category(:spanish)).to eq(50.0)
        expect(round.percent_correct_by_category(:WalkingDead)).to eq(100.0)
      end
    end
end
