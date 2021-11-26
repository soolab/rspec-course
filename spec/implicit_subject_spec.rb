# frozen_string_literal: true

# 만약에 'Hash' 라고 한다면 subject가 안먹힐거임.
# class명을 적어주면 subject를 쓸 수 있다고 생각하면 된다.
RSpec.describe Hash do

  # 뭐 일반적인 상황에서는 이렇게 let을 이용해서
  # 데이터를 만들겠지만 RSepc이 Describe 하는 것은
  # 그냥 subject로 하면 편하다는 얘기임.
  let(:my_hash) { Hash.new }

  it 'should start off empty' do

    # subject 라는 것은 RSpec이 Describe하는 클래스와 관련이 있다고 보면 됨
    # subejct는 사실 Hash.new와 같게 되는 것임.
    # Implicit subject라고 보면 됨. 암시적으로 객체를 생성해서 그런가보다.
    puts subject
    puts subject.class
    expect(subject.length).to eq(0)
  end

  it 'should include some_key in hash' do
    expect(subject.length).to eq(0)
    subject[:some_key] = 'Some Value'

    # 하나의 key가 있을떄 그것을 length로 치는 것 같다.
    # 이건 추가적으로 알아두도록 하자.
    expect(subject.length).to eq(1)
  end

  it 'is isolated between examples' do
    # let 이랑 비슷하게 it 마다 초기화 된다고 생각하면 됨.
    # 맨 위에 설명을 참고하여 subject와 let을 이해하면 될 것임.
    expect(subject.length).to eq(0)
  end
end