# frozen_string_literal: true

class Card

  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

RSpec.describe 'Card' do

  # 'it' is a kind of method
  # it take stirng as a first parameter
  # and take do end for yield

    # card = Card.new('Ace of Spades')
    # expect(1+1).to eq(2)
    # it is described in .rspec file
    # eq is a parameter of to method!
    # expect(card.type).to(eq('Ace of Spades'))
    # below is the same with above
    # expect(card.type).to eq('Ace of Spades')

  # 기본적으로 IT 자체가 메소드 이기 때문에 안에 들어가는 것은
  # 로컬 변수라고 생각하면 됨
  # 그래서 이렇게 card를 따로 만들긴 했는데 리팩토링 해야 함.

    it 'has a rank' do
      card = Card.new('Ace', 'Spades')
      expect(card.rank).to eq('Ace')
    end

    it 'has a rank' do
      card = Card.new('Ace', 'Spades')
      expect(card.suit).to eq('Spades')
    end

end