require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("name", Card.new("What is a walker?", "zombie", :WalkingDead))

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    guess = "name"
    turn = Turn.new(guess, Card.new("What is a walker?", "zombie", :WalkingDead))

    expect(turn.guess).to eq(guess)
  end

  context 'gives feedback' do
    it 'says correct when the guess is correct'do
      guess = "zombie"
      turn = Turn.new(guess, Card.new("What is a walker?", "zombie", :WalkingDead))

      expect(turn.feedback).to eq("Correct!")
    end

    it 'says incorrect when the guess is wrong'do
      guess = "Nice person who walks dogs."
      turn = Turn.new(guess, Card.new("What is a walker?", "zombie", :WalkingDead))

      expect(turn.feedback).to eq("Incorrect")
    end
  end
end
