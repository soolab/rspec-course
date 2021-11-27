# frozen_string_literal: true

RSpec.describe 'matching arguments' do
  it 'can return different values depending on the argument' do
    three_element_array = double

    # it 에서 설명한 것 대로, argument가 뭔가에 따라서 return value를 다르게 설정 할 수 있다는 것임.
    # with라는 것만 새로 추가된 것을 볼 수 있는데,
    # no_args라는 것은 특별한 키워드이거나 RSpec에서 제공하는 함수인 것으로 추정된다.
    # 그러니 spelling에 유의하도록 하자. 물론 argument가 존재하지 않을떄는 1을 리턴한다는 말이다.
    allow(three_element_array).to receive(:first).with(no_args).and_return(1)

    # with(1)이라고 되어있는데 이것은 argument의 갯수를 말하는게 아니라
    # 실제로 1이라는 argument가 들어올떄는 [1]를 리턴한다고 설정한 것이다.
    # 그냥 Mocking을 좀 더 구체적으로 할 수 있는 기능을 제공하는 것이라고 이해하면 될 것이다.
    allow(three_element_array).to receive(:first).with(1).and_return([1])

    # 3 이상일때를 표현한 것이다.
    # 이런건 잘 기억이 안날 것 같긴하다.
    allow(three_element_array).to receive(:first).with(be >= 3).and_return([1, 2, 3])

    expect(three_element_array.first).to eq(1)
    expect(three_element_array.first(1)).to eq([1])
    expect(three_element_array.first(3)).to eq([1, 2, 3])
    expect(three_element_array.first(4)).to eq([1, 2, 3])
  end
end
