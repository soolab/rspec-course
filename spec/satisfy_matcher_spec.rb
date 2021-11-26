# frozen_string_literal: true

RSpec.describe 'satisfy matcher' do
  subject { 'racecar' }

  it 'is a palindrome' do

    # satisfy는 꽤나 강력한데
    # 그 이유는 다른 matcher와 달리 굉장히 자유롭게 로직을 짤 수 있다는 것이다.
    # 아래와 같은 식으로 boolean 을 return 하도록 만들면 된다.
    expect(subject).to satisfy { |value| value == value.reverse }
  end

  it 'can accept a custom error message' do
    # {}를 써도 되긴 하는데 여기는 그냥 do end로
    # 위에랑 같은거 같은데??
    # 그냥 error message를 satisfy의 argument로 추가할 수 있다는거지
    # 맥락은 같은거임. 에러 메세지 보기 편하라고 이런 형태로 쓰는거라고 이해하면 됨.
    expect(subject).to satisfy('be a palindrom') do |value|
      value == value.reverse
    end
  end
end
