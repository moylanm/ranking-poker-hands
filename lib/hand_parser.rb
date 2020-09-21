module Parsable
  attr_writer :parser

  def parser
    @parser ||= Parser.new(hand: self)
  end

  def parse
    parser.parse
  end
end

class Parser
  attr_accessor :hand

  def initialize(hand:)
    @hand = hand
  end

  def parse
    send("parse_#{hand.downcase}".to_sym)
  end

  def parse_straightflush; end

  def parse_fourofakind
    parse_quads
  end

  def parse_fullhouse
    parse_triples
    parse_high_pair
  end

  def parse_flush; end

  def parse_straight; end

  def parse_threeofakind
    parse_triples
  end

  def parse_twopair
    parse_high_pair
    parse_low_pair
  end

  def parse_onepair
    parse_high_pair
  end

  def parse_flop; end

  private

  def parse_quads
    quad_rank = hand.ranks.key(4)
    hand.quads = RANKS[quad_rank]
    filter_rank(rank: quad_rank)
  end

  def parse_triples
    trips_rank = hand.ranks.key(3)
    hand.triples = RANKS[trips_rank]
    filter_rank(rank: trips_rank)
  end

  def parse_high_pair
    high_rank = pair_ranks.max { |a, b| RANKS[a] <=> RANKS[b] }
    hand.high_pair = RANKS[high_rank]
    filter_rank(rank: high_rank)
  end

  def parse_low_pair
    low_rank = pair_ranks.min { |a, b| RANKS[a] <=> RANKS[b] }
    hand.low_pair = RANKS[low_rank]
    filter_rank(rank: low_rank)
  end

  def pair_ranks
    hand.ranks.select { |_, v| v == 2 }.keys
  end

  def filter_rank(rank:)
    hand.side_cards.delete_if do |card|
      card.rank == rank
    end
  end
end

