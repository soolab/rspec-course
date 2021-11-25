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
  # before do
    # instance varialbe로 만들어 줘야함.
    # 근데 한 번만 그럼 초기화 시켜줘야 되는거 아닌가.
    # 각각의 it마다 instance variable이 초기화 되어야 한다는 것 같다.
    # 뭐 그렇게 이해해도 될 것 같다.
    # 단순히 card만 하더라도 괜찮은 것 같지만 그렇게 하면 안된다는 사실.
    # 근데 궁금한건 module이나 class가 아닌데 instance variable을 사용할 수 있는거임??
    # @card = Card.new('Ace', 'Spades')
  # end

  # 이게 두 번째 방법임
  # RSpec 안에다가는 method를 정의할 수 있다는 거임.
  # 근데 솔직히 이게 이해가 안감. 이미 RSpec의 describe 메소드 안에 들어와 있는거 아닌가.
  # 그건 아닌가. yield 안에 있는 것이라서 상관 없을지도 모른다.
  # 그리고 yield안에는 어떤 것이라도 사용할 수 있는 것인가.
  # 아무튼 이렇게 Card를 뱉는 card method를 만들고 각각의 it 안에서 card를 사용할 수 있다는 것이다.


  # def card
  #   Card.new('Ace', 'Spades')
  # end

  # 세번째 방법은 let이라는 method를 사용하는 것이다.
  # 메모이제이션이라고는 하지만 그냥 캐싱이라고 이해하면 편하다.

  # {} 에 있는 것이 card에 초기화된다고 생각하면 된다.
  let(:card) { Card.new('Ace', 'Spades') }

  # Lazy loading이기 때문에 y가 필요하다면 먼저 let y를 볼 것이다.
  # 근데 y를 초기화 하려면은 x가 필요하네? 뭐 이런식인 것이다.
  let(:x) { 1 + 1}
  let(:y) { x + 10 }

    it 'has a rank' do
      expect(card.rank).to eq('Ace')
    end

    it 'has a rank' do
      expect(card.suit).to eq('Spades')
    end

  # 이 테스트 케이스 같은 경우
  # card helper method를 사용하게 되면은 되지 않을 것이다.
  # before, instance variable을 사용해야지만 가능할 것이다.
  # 뭐 장단점이 있는데 이건 알아서 판단하도록 한다.

  # 하지만 이 예제는 let을 위해서 나온 것이구만.
  # let 이라는 것은 it 마다 새로 초기화 되는 것은 맞다.
  # 하지만 하나의 it안에서는 caching되어서 한 번만 초기화되기 때문에
  # helper method와는 다른 결과를 맞이하게 된다는 것이다.
  # 각각의 이런 차이점을 알면은 let을 사용하는 이유를 알 것이다.
  # 또 하나의 특징은 lazy loading이라는 것이다.
  # 즉 describe에 있다고 그게 그때 생기는 것이 아니라
  # 실제 card가 필요할때 생긴다는 것이다.
  # before와 비교하면 매 it 마다 무조건 생기니까 메모리 상으로 문제가 생길 수 있고
  # 딱 필요한 let만 만들어서 중복을 줄일 수 있다는 것이다.
  # 더 느리다는 것이다. 이게 let을 쓰는 이유라고 생각하면 된다.

  # let! 이라는 것은 Lazy Loading이 아니기 떄문에
  # 일단 let이랑 비슷하게 it마다 돌긴 하는데
  # 그게 해당 it에서 필요할때 로딩하는게 아니라 그냥 만들어진다.
  # 쉽게 생각하면 it이 돌기전에 만들어진다고 생각하면 될 것 같다.

  it 'has a rank and that rank can change' do
    expect(card.rank).to eq('Ace')
    card.rank = 'Queen'
    expect(card.rank).to eq('Queen')
  end

  it 'has a custom error message' do
    comparision = 'Spades'

    # 뭐 별건 아닌데 에러 메세지를 내가 원하는 방식으로 나타내는 것임
    # 두 번째 string argument가 그냥 나오는 메세지라고 생각하면 된다.
    # 뭐 굳이 사용해야하나 라는 생각이 들긴 한다.
    expect(card.suit).to eq(comparision), "Hey, I expected #{comparision} but I got #{card.suit} instead!"
  end

end