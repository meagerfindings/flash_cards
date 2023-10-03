# frozen_string_literal: true

class Turn
  def initialize(guess, card)
    @guess = guess
    @card   = card
  end

  def guess
    @guess
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect"
    end
  end

  def card
    @card
  end

  def correct?
    guess == card.answer
  end
end
