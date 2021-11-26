# frozen_string_literal: true

RSpec.describe 'change matcher' do
  subject { [1, 2, 3] }

  it 'checks that a method chages object state' do
    # {} 안에 루비 코드를 넣어줄 수 있다.
    # 이 코드의 형태도 프로젝트에서 심심치 않게 볼 수 있다.
    # change라는 것은 tracking을 함으로써
    # 어떤 action 을 취하면 어떤 것이 from 에서 to로 바뀌느냐 이렇게 이해를 하면 되겠음.
    # expect {} 안에 있는 것이 action이라고 생각하면 되고
    # change {} 안에 있는 것이 tracking 할 무언가라고 생각하면 된다.
    expect { subject.push(4) }.to change { subject.length }.from(3).to(4)

    # 이건 좀 어색하게 느껴지긴 하는데.
    # length 가 1이 올랐다고 하는거임.
    # 프로젝트에서도 이런식으로 사용하는게 있음.
    # active record의 count가 1 올랐다는 식으로 이용할 수 있음.
    # 단순히 증감에 쓸 수 있는 것이 by라는 method라고 이해해도 괜찮을 듯 하다.
    expect { subject.push(4) }.to change { subject.length }.by(1)
  end

  it 'accepts negative arguments' do
    expect { subject.pop }.to change { subject.length }.from(3).to(2)
    expect { subject.pop }.to change { subject.length}.by(-1)
  end
end
