require_relative 'constants'

class Card
  attr_reader :rank, :suit, :rank_value

  def initialize(rank:, suit:)
    @rank = rank
    @suit = suit
    @rank_value = RANKS[rank]
  end

  def >(other)
    rank_value > other.rank_value
  end

  def <(other)
    rank_value < other.rank_value
  end

  def ==(other)
    rank_value == other.rank_value
  end
end

class Cards
  attr_reader :cards, :ranks, :suits

  def initialize(cards)
    @cards = cards
    @ranks = _ranks
    @suits = _suits
  end

  private

  def _ranks
    get_attributes(:rank)
  end

  def _suits
    get_attributes(:suit)
  end

  def get_attributes(attribute)
    attr_values = cards.each_with_object([]) do |card, array|
      array << card.send(attribute)
    end

    attr_values.uniq.each_with_object({}) do |value, hash|
      hash[value] = attr_values.count(value)
    end
  end
end
