# frozen_string_literal: true

RSpec.describe 'allow method review' do
  it 'can customize return value for methods on doubles' do
    calculator = double

    # 이렇게만 한다면은 default로 calculator는 nil을 반환하게 되어있음.
    # allow(calculator).to receive(:add)

    # 이렇게 하면은 메소드를 지정함과 동시에 return value도 지정할 수 있다.
    # 상세한 비지니스 로직까지는 만들지 않지만은 return value는 만들 수 있다는 말이다.
    # 궁금한것은 파라미터나 인자에 대해서는 뭔가 설정할 수 없는 것인가??
    allow(calculator).to receive(:add).and_return(15)

    # 뭐 일단은 add라는 메소드를 만들기는 했지만
    # 파라미터에 대한 정보는 무시한다고 생각하면 된다.
    # 아래의 테스트 코드들은 통과한다.
    expect(calculator.add).to eq(15)
    expect(calculator.add(1)).to eq(15)
    expect(calculator.add(-2, -3, -5)).to eq(15)
    expect(calculator.add('hello')).to eq(15)
  end

  it 'can stub one or more methods on a real object' do
    arr = [1, 2, 3]
    # 원래 arr에 sum이라느 method가 존재하나 보다.
    # 그래서 정상적으로는 아래의 테스트는 통과한다.
    # expect(arr.sum).to eq(6)

    # 변태스럽긴 하지만 원래 arr의 sum method를 override를 해보자.
    # 아래의 테스트는 통과한다.
    allow(arr).to receive(:sum).and_return(10)
    expect(arr.sum).to eq(10)
  end

  it 'can return multiple return values in sequence' do
    mock_array = double
    # 좀 이상하게 와닿긴 한데 return value를 여러개 뱉어낼 수 있다.
    # 정확하게 말하면은 여러개를 한꺼번에 뱉어내는 것이 아니라,
    # 순서대로 하나씩 뱉어낸다고 생각하면 된다.
    allow(mock_array).to receive(:pop).and_return(:c, :b, nil)

    expect(mock_array.pop).to eq(:c)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to eq(:nil)

    # 더 뱉어낼 것이 없다면은 맨 마지막것을 계속 return 한다고 생각하면 된다.
    # 그래서 아래의 테스트도 다 통과하게 된다.
    expect(mock_array.pop).to eq(:nil)
    expect(mock_array.pop).to eq(:nil)
    expect(mock_array.pop).to eq(:nil)
  end
end
