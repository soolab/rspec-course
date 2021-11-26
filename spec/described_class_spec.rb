# frozen_string_literal: true

class King
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe King do

  # described_class라는 것은 현재 RSpec에 의해 described된 class이다.
  # 말 그대로 해석하면 된다.
  # 이건 아래와 같이 King이라는 class명을 명시적으로 적지 않아도 된다고 생각하면 된다.
  # 만약 King으로 했다가 Royal나 Prince로 바뀌게 되면은 하나하나 다 바꿔야 할테니까
  # 이런 경우를 생각하더라도 described_class를 사용하면 편하다는 개념임.
  # 엄청난건 아니고 뭐 그런 개념임.
  # subject { King.new('Boris') }
  # let(:louis) { King.new('Louis') }

  subject { described_class.new('Boris') }
  let(:louis) { described_class.new('Louis') }

  it 'represents a great person' do
    expect(subject.name).to eq('Boris')
    expect(louis.name).to eq('Louis')
  end
end
