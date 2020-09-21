require_relative 'cards'

module CardsFactory
  def self.build(config:, cards_class: Cards)
    cards_class.new(
      config.collect do |card_config|
        create_card(card_config: card_config)
      end.sort_by(&:rank_value)
    )
  end

  def self.create_card(card_config:, card_class: Card)
    card_class.new(rank: card_config[0], suit: card_config[1])
  end
end
