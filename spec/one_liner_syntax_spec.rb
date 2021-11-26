# frozen_literal_string: true

RSpec.describe 'shorthand syntax' do

  # 음 이번 경우는 RSpec.describe 에서는 특정한 class를 묘사하고 있지는 않음.
  # 그래서 아래와 같이 subject를 사용한다 하더라도 그냥 let과 같이 사용되는것이라고
  # 생각할 수 있을 것 같다. 이건 내 추측임.
  subject { 5 }

  context 'with classic syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    # 이건 위의 it과 정확히 일치하는 것임.
    # do end를 굳이 안써도 된다는 것이고
    # it에 대한 설명을 굳이 쓰지 않아도 됨.
    # 영어같은 경우는 {}에 있는 것을 보고 알아서 적당한 문장을 만들어줌.
    # 이러한 syntax를 종종 career api에서 봤는데 이제야 이해가 되는구만.
    it { is_expected.to eq(5) }
  end
end

