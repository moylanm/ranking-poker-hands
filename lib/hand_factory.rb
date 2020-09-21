require_relative 'cards_factory'
require_relative 'hand_identifier'
require_relative 'hand'

module HandFactory
  def self.build(cards:)
    cards_obj = CardsFactory.build(config: cards)
    const_get(HandIdentifier.identify(cards_obj: cards_obj))
      .new(cards_obj: cards_obj, original: cards)
  end
end
