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

  # before
  # before(:example)
  # before(:suite)
  # 뭐 등등 많긴 한데 아래처럼 적으면 모든 it이 돌기전에 다시 이 before문을 실행시킨다고 이해하면 된다.

  # 이게 첫 번쨰 방법임
  # instance variable과 before method를 사용하는 방법이다.
  before do
    # instance varialbe로 만들어 줘야함.
    # 근데 한 번만 그럼 초기화 시켜줘야 되는거 아닌가.
    # 각각의 it마다 instance variable이 초기화 되어야 한다는 것 같다.
    # 뭐 그렇게 이해해도 될 것 같다.
    # 단순히 card만 하더라도 괜찮은 것 같지만 그렇게 하면 안된다는 사실.
    # 근데 궁금한건 module이나 class가 아닌데 instance variable을 사용할 수 있는거임??
    @card = Card.new('Ace', 'Spades')
  end

  # 이게 두 번째 방법임
  # RSpec 안에다가는 method를 정의할 수 있다는 거임.
  # 근데 솔직히 이게 이해가 안감. 이미 RSpec의 describe 메소드 안에 들어와 있는거 아닌가.
  # 그건 아닌가. yield 안에 있는 것이라서 상관 없을지도 모른다.
  # 그리고 yield안에는 어떤 것이라도 사용할 수 있는 것인가.
  # 아무튼 이렇게 Card를 뱉는 card method를 만들고 각각의 it 안에서 card를 사용할 수 있다는 것이다.


  # def card
  #   Card.new('Ace', 'Spades')
  # end

    it 'has a rank' do
      expect(@card.rank).to eq('Ace')
    end

    it 'has a rank' do
      expect(@card.suit).to eq('Spades')
    end

  # 이 테스트 케이스 같은 경우
  # card helper method를 사용하게 되면은 되지 않을 것이다.
  # before, instance variable을 사용해야지만 가능할 것이다.
  # 뭐 장단점이 있는데 이건 알아서 판단하도록 한다.
  it 'has a rank and that rank can change' do
    expect(@card.rank).to eq('Ace')
    @card.rank = 'Queen'
    expect(@card.rank).to eq('Queen')
  end
end