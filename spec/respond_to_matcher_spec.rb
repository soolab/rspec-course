# frozen_string_literal: true

class HotChocolate
  def drink
    'Deliciout'
  end

  def discard
    'PLOP!'
  end

  def purchase(number)
    "Awesome, I just purchased #{number} more hot chocolate beverages!"
  end
end

RSpec.describe HotChocolate do
  it 'confirms that an object can response to a method' do

    # 기본적으로 repsonse_to라는 것은 method에 관심이 있다.
    # 기본적으로 인스턴스가 해당 method를 가지고 있는지 판단할 수 있다.
    expect(subject).to respond_to(:drink)
    expect(subject).to respond_to(:drink, :discard)
    expect(subject).to respond_to(:drink, :discard, :purchase)
  end

  it 'confirms an obiject can respond to a method with arguments' do

    # 아래와 같이 작성하게 되면은 필요한 parameter의 갯수를 테스트 할 수 있다.
    expect(subject).to respond_to(:purchase).with(1).arguments
  end

  # 이런것도 is_expected.to 같은 걸로 바꿀 수 있음.
end