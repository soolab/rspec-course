# frozen_string_literal: true

RSpec.describe 'predicate methods and predicate matchers' do
  it 'can be tested with Ruby methods' do
    result = 16 / 2
    expect(result.even?).to eq(true)
  end

  it 'can be tested with predicate matchers' do
    # 물론 위의 it 처럼 쓸 수 있긴 한데
    # 이 방법이 더 elegant 한 방법이다.
    # be_even같은 것을 predicate methods라고 부른다고 한다.
    # 이러한 predicate 같은 것은 기본적인 ~~?method 명을 따른다고 생각하면 된다
    # even? odd? zero? empty? 라는 메소드 명을 생각하면 쉽게 유추할 수 있다.
    expect(16 / 2).to be_even
    expect(15).to be_odd
    expect(0).to be_zero
    expect([]).to be_empty
  end
  # 이건 전 시간에 이용한 0을 subject로 만들고
  # is_expected 라는 것으로 one liner로 사용하는 것이라고 생각하면 된다.
  describe 0 do
    it { is_expected.to be_zero }
  end
end
