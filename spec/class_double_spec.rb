# frozen_string_literal: true

class Deck
  def self.build
    # Business logic to build a whole bunch of cards
    # 여기에는 일부러 아무것도 안적은 것임.
    # class를 Mocking하기 위해서지.
  end
end

class CardGame
  attr_reader :card

  def start
    @card = Deck.build
  end
end

RSpec.describe CardGame do
  it 'can only implement class methods that ar defined on a class' do

    # class를 Mocking하는 방법에 대해서 알아보는 것임.
    # 실제로 class를 Mocking해야 하는 경우는 좀 생각을 해봐야겠다.

    # 이것도 실제로 shuffle이라는 것을 implement를 할 수 없음
    # 왜냐면 Deck이라는 것에는 shuffle이라는 것이 존재하지 않으니까.
    # 그래서 아래의 코드는 RSpec에서 에러를 내게 된다.
    # class_double(Deck, build: ['Ace', 'Queen'], shuffle: ['Queen', 'Ace'])

    # 이렇게 하면은 성공이다.
    # class_double('Deck', build: ['Ace', 'Queen'])

    # as_stubbed_const를 해야지 CardGame의 Deck이 아래의 Mocking 한 것으로 바뀐다는 것 같다.
    deck_klass = class_double(Deck, build: ['Ace', 'Queen']).as_stubbed_const

    # 일단 deck_klass에 build가 있다는 것을 확인하고
    expect(deck_klass).to receive(:build)

    # card를 생성해준 다음에 테스트를 해보자.
    subject.start
    expect(subject.card).to eq(['Ace', 'Queen'])
  end
end
