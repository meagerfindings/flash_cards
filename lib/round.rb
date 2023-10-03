# frozen_string_literal: true

class Round
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
  end

  def current_card
    index = turns.count
    @deck.cards[index]
  end

  def turns
    @turns
  end

  def number_correct
    correct = @turns.filter_map do |turn|
       turn if turn.correct?
    end

    correct.count
  end

  def percent_correct
    if @turns.count > 0
      (number_correct / @turns.count.to_f) * 100
    else
      0.00
    end
  end

  def number_correct_by_category(category)
    correct_in_category = @turns.filter_map do |turn|
      if turn.card.category == category
        if turn.correct?
           turn
        end
      end
    end

    correct_in_category.count
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / total_in_category(category).to_f) * 100
  end

  private
  def total_in_category(category)
    @turns.filter_map { |turn| turn if turn.card.category == category }.count
  end
end
