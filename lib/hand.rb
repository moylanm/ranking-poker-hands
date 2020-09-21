require_relative 'hand_parser'

class Hand
  include Parsable

  attr_reader :cards, :hand, :score

  def initialize(cards_obj:, original:)
    @cards = cards_obj
    @hand = original
    @score = default_score

    parse
  end

  def default_score
    raise NotImplementedError, self.class.to_s
  end

  def side_cards
    cards.cards
  end

  def ranks
    cards.ranks
  end

  def suits
    cards.suits
  end

  def downcase
    self.class.to_s.downcase
  end

  def to_a
    hand
  end
end

class StraightFlush < Hand
  def default_score
    9
  end
end

class FourOfAKind < Hand
  attr_accessor :quads

  def default_score
    8
  end
end

class FullHouse < Hand
  attr_accessor :triples, :high_pair

  def default_score
    7
  end

  def pair
    high_pair
  end
end

class Flush < Hand
  def default_score
    6
  end
end

class Straight < Hand
  def default_score
    5
  end
end

class ThreeOfAKind < Hand
  attr_accessor :triples

  def default_score
    4
  end
end

class TwoPair < Hand
  attr_accessor :high_pair, :low_pair

  def default_score
    3
  end
end

class OnePair < Hand
  attr_accessor :high_pair

  def default_score
    2
  end

  def pair
    high_pair
  end
end

class Flop < Hand
  def default_score
    1
  end
end
