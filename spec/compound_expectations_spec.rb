# frozen_string_literal: true

RSpec.describe 25 do

  it 'can test for multiple matchers' do
    expect(subject).to be_odd.and be > 20
  end
end

RSpec.describe 'caterpillar' do
  it 'supports multiple matchers on a single line' do
    expect(subject).to start_with('cat').and end_with('pillar')
  end
end

RSpec.describe [:usa, :canada, :mexico] do
  it 'can check for multiple possibilities'  do

    # array에 sample이라는 method가 있는 것 같고
    # element 중에 뭔가 하나를 뽑아내는 그런 것 같다.
    # 테스트 케이스를 보면 말이다.
    # 이렇게 3개도 되고 4개도되고 뭐 그런식이다.
    expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:maxico)
  end
end