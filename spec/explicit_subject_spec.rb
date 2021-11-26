# frozen_string_literal: true

RSpec.describe Hash do

  # 이번에는 명식적으로 subject를 초기화하는 방법에 대해서 알아볼거임
  # 전에 한 것 처럼 암묵적으로 subject를 만들게 되면은
  # 단순히 Hash.new 가 생성될 것임.
  # 하지만 어떤때는 class의 object가 특정 형태로 초기화되기를 원할 것임.
  # 이 초기화되는 것을 default로 사용하고 싶을 때 쓰면 적절할 것 같다.
  # subject do
  #   { a: 1, b:2 }
  # end

  # 이건 뭐 do end로 할것이냐 아니면 {}로 할 것이냐에 차이라서
  # 그것에 대한건 넘어가도록 하고
  # bob이라는 alias를 줄 수 잇다 정도로 생각하면 됨.
  # 그래서 밑에 bob이라고 했지만 이것은 결국 subject를 의미한다고
  # 생각하면 될 것 같다.
  subject(:bob) { { a:1, b:2 } }

  it 'has two key-value pairs' do
    # 암묵적으로 했으면 이게 통과가 안됐겠지만
    # 명시적으로 subject를 위에서 초기화 했기 때문에
    # 이것은 length가 2로 통과가 되는 것으로 이해하면 되겠음.
    expect(subject.length).to eq(2)
    expect(bob.length).to eq(2)
  end

  describe 'nexted example' do

    # 이 it은 describe에 nested 되었지만
    # 최상단에 정의된 subject의 영향을 받는다고 생각하면 될 것임.
    it 'has two key-value pairs' do
      expect(subject.length).to eq(2)
      expect(bob.length).to eq(2)
    end
  end

  describe 'nestex example test' do

    # 이 subject는 상단의 describe안에 nested 되어있음
    # 그렇기 때문에 이 describe의 scope안에서만 subject는
    # 아래와 같이 정의된다는 것임.
    # 이건 개인적으로 테스트 해봤는데 let이랑 거의 비슷하다고 보면 됨
    # 알아서 class의 object를 던지는 것만 달라지는 것이고 편의성을 유도한다고 생각하면 될 듯.
    subject(:test) { { a:1, b:2, c:3} }

    it 'has three key-value pairs' do
      expect(subject.length).to eq(3)
      expect(test.length).to eq(3)
    end
  end
end
