require_relative 'hand_factory'

class HandEvaluator
  attr_reader :left, :right

  def initialize(left:, right:)
    @left = HandFactory.build(cards: left)
    @right = HandFactory.build(cards: right)
  end

  def self.return_stronger_hand(left:, right:)
    new(left: left, right: right).return_stronger_hand
  end

  def return_stronger_hand
    unless left.score == right.score
      return left.score > right.score ? left.to_a : right.to_a
    end

    resolve_tie
  end

  private

  def resolve_tie
    send("#{left.downcase}_tie")
  end

  def straightflush_tie
    compare_side_cards
  end

  def fourofakind_tie
    unless left.quads == right.quads
      return left.quads > right.quads ? left.to_a : right.to_a
    end

    compare_side_cards
  end

  def fullhouse_tie
    unless left.triples == right.triples
      return left.triples > right.triples ? left.to_a : right.to_a
    end

    left.pair > right.pair ? left.to_a : right.to_a
  end

  def flush_tie
    compare_side_cards
  end

  def straight_tie
    compare_side_cards
  end

  def threeofakind_tie
    unless left.triples == right.triples
      return left.triples > right.triples ? left.to_a : right.to_a
    end

    compare_side_cards
  end

  def twopair_tie
    unless left.high_pair == right.high_pair
      return left.high_pair > right.high_pair ? left.to_a : right.to_a
    end
    unless left.low_pair == right.low_pair
      return left.low_pair > right.low_pair ? left.to_a : right.to_a
    end

    compare_side_cards
  end

  def onepair_tie
    unless left.pair == right.pair
      return left.pair > right.pair ? left.to_a : right.to_a
    end

    compare_side_cards
  end

  def flop_tie
    compare_side_cards
  end

  def compare_side_cards
    left.side_cards.zip(right.side_cards) do |left_card, right_card|
      unless left_card == right_card
        return left_card > right_card ? left.to_a : right.to_a
      end
    end
  end
end
