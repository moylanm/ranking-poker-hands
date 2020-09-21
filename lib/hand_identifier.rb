class HandIdentifier
  attr_reader :cards

  def initialize(cards_obj:)
    @cards = cards_obj
  end

  def self.identify(cards_obj:)
    new(cards_obj: cards_obj).identify
  end

  def identify
    HAND_SIGNATURES.each do |hand|
      return hand.to_sym if send("#{hand.downcase}?".to_sym)
    end
  end

  private

  def straightflush?
    straight? && flush?
  end

  def fourofakind?
    cards.ranks.value?(4)
  end

  def fullhouse?
    threeofakind? && onepair?
  end

  def flush?
    cards.suits.value?(5)
  end

  def straight?
    low_card_index = RANKS.keys.index(cards.ranks.keys.first)
    cards.ranks.length == 5 && cards.ranks.keys == RANKS.keys[low_card_index, 5]
  end

  def threeofakind?
    cards.ranks.value?(3)
  end

  def twopair?
    cards.ranks.values.count(2) == 2
  end

  def onepair?
    cards.ranks.values.count(2) == 1
  end

  def flop?
    !straightflush? && cards.ranks.length == 5
  end
end
