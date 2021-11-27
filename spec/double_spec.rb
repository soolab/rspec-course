# frozen_string_literal: true

RSpec.describe 'a random double' do
  it 'only allows defined methods to be invoked' do

    # double 이라는 것은 fake object를 만드는 것이라고 생각하면 된다.

    # stuntman 이라는 변수에다가 임시로 메소드들을 만들 수 있다.
    # double이라는 것이 그렇게 만들어주는 것이라고 생각하면 된다.
    # 이게 첫 번째 방법이라고 생각하면 되고
    stuntman = double('Mr. Danger', fall_off_ladder: 'Ouch', light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to eq(true)

    # 이게 두 번쨰 방법이라고 생각하면 되는데
    # 개인적으로 두 번쨰 방법이 뭔가 맘에 든다.
    testman = double('Mr. Jinsoo')
    allow(testman).to receive(:fall_off_ladder).and_return('Ouch')
    expect(testman.fall_off_ladder).to eq('Ouch')

    # 이게 세 번째 방법인데
    # 흠 이게 제일 마음에 드는 것 같기도 하고 말이다.
    helloman = double('Mr. Hello')
    allow(helloman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)
    expect(helloman.fall_off_ladder).to eq('Ouch')
    expect(helloman.light_on_fire).to eq(true)
  end
end
