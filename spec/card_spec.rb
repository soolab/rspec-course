# frozen_string_literal: true

class Card

  attr_accessor :rank, :suite

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
  end
end

RSpec.describe 'Card' do

  # 'it' is a kind of method
  # it take stirng as a first parameter
  # and take do end for yield

  it 'has a type' do
    # card = Card.new('Ace of Spades')
    # expect(1+1).to eq(2)
    # it is described in .rspec file
    # eq is a parameter of to method!
    # expect(card.type).to(eq('Ace of Spades'))
    # below is the same with above
    # expect(card.type).to eq('Ace of Spades')

    it 'has a rank' do
      card = Card.new('Ace', 'Spades')
      expect(card.rank).to eq('Ace')
    end

    it 'has a rank' do
      card = Card.new('Ace', 'Spades')
      expect(card.suite).to eq('Spades')
    end
  end
end