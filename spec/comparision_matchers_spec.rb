# frozen_string_literal: true

RSpec.describe 'comparision matchers' do
  it 'allows for comparision with built-in Ruby operators' do
    expect(10).to be > 5
    expect(8).to be < 15
    expect(1).to be >= -1
    expect(1).to be >= 1

    expect(22).to be <= 100
    expect(22).to be <= 22
  end

  # 100 이 subject가 되는 마법
  # 이렇게 할 수도 있구나.
  describe 100 do

    # is_expected라는 것은 내가 보기에
    # expect(subject)를 바꾼 것이라고 생각할 수 있을 것 같다.
    # 이렇게 되면은 왜 model spec에서 is_expected를 사용하는지 의문이 해결된다.
    it { is_expected.to be > 90 }
    it { is_expected.to be >= 90 }
    it { is_expected.to be <= 500 }
    it { is_expected.to be <= 100 }
    it { is_expected.not_to be > 150 }
  end
end
