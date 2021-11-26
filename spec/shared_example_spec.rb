# frozen_string_literal: true

RSpec.shared_examples 'a Ruby object with three elements' do

  # subject 같은 경우는 lazy하게 동작함으로
  # argument로 뭔가를 받아오지 않아도 된다.
  # 이게 개인적으로 좀 루비할때 어려운 부분이긴 하다.
  # 명시적으로 argument로 넘겨준다면 좀 더 이해하기 쉬웠을 것이다.

  # 여기는 뭐 하나의 it만 만들기는 했지만,
  # 더 많은 it을 추가적으로 만들 수 있다.
  # 어떻게 보면 이 코드를 included_examples를 사용하는 곳에
  # 복붙한다는 느낌으로 이해해도 괜찮을 것 같다는 생각이 든다.
  it 'returns the number of items' do
    expect(subject.length).to eq(3)
  end
end

# 아래의 여러가지를 만들긴했는데
# 이것은 공통적으로 length가 3인 경우를 그냥 억지로 만들어낸 것일 뿐
# 별다른 의미는 없으니 참고하도록 하자.
RSpec.describe Array do
  subject { [1, 2, 3] }

  # 자 각각의 RSpec의 상황을 보자.
  # 유도하긴 했지만 it이 완전히 동일하다.
  # 이럴떄 동일한 코드를 작성하기 보다는 shared_example을 만들자는거임.
  # 정확히 말하자면은 shared_it이 뭔가 더 이해하기 쉬웠을 것 같긴 하지만 말이다.
  # 이렇게 동일한 it을 복붙하는 것은 좋지 않다. shared_example로 공유하자는 것임.

  # 이 it은 아래에 반복적으로 나타난다.
  # it 'returns the number of items' do
  #   expect(subject.length).to eq(3)
  # end

  include_examples 'a Ruby object with three elements'

end

RSpec.describe String do
  subject { 'abc' }

  # it 'returns the number of items' do
  #   expect(subject.length).to eq(3)
  # end
  include_examples 'a Ruby object with three elements'
end

RSpec.describe Hash do
  subject { { a: 1, b: 2, c: 3} }

  # it 'returns the number of items' do
  #   expect(subject.length).to eq(3)
  # end
  include_examples 'a Ruby object with three elements'
end

class SausageLink
  def length
    3
  end
end

RSpec.describe SausageLink do
  subject { described_class.new }

  # it 'returns the number of items' do
  #   expect(subject.length).to eq(3)
  # end
  include_examples 'a Ruby object with three elements'
end