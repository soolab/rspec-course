# frozen_string_literal: true

RSpec.describe 'all matcher' do

  it 'allows for aggregate checks' do
    [5, 7, 9].each do |val|
      expect(val).to be_odd
    end
  end

  it 'another way' do
    # 위의 it 방법을 사용해도 되지만
    # 이게 더 우아한 방법임.
    expect([5,7,9]).to all(be_odd)
    expect([5,7,9]).to all be_odd

    expect([4, 6, 8, 10]).to all(be_even)
    expect([[], [], []]).to all(be_empty)

    expect([0,0]).to all(be_zero)

    # 이런거는 특히나 잘 생각이 안날 수 있으니
    # 나중에 잘 참고해서 우아한 코드를 작성하도록 하자.
    expect([5,7,9]).to all(be < 10)
  end

  describe [5, 7, 9] do
    # 뭐 이건 더 이상 생략을 설명하도록 하겠다.
    # 여러번 했으니까.
    it { is_expected.to all(be_odd) }
    it { is_expected.to all(be < 10) }
  end

end
