# frozen_string_literal: true

class Deck
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.filter_map do |card|
      card if card.category == category
    end
  end

  def cards
    @cards
  end

  def find_categories
    categories = @cards.map do |card|
      card. category
    end

    categories.uniq
  end
end
