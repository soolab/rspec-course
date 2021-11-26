# frozen_string_literal: true

RSpec.describe 'raise_error matcher' do

  def some_method
    x
  end

  # 보통 이렇게 ;를 써서 한 줄에 쓰기도 함.
  # 하나의 팁이니까 알아두면 좋을 것이다.
  class CustomError < StandardError;end

  it 'can check for any error' do
    # raise_error에 argument로 아무것도 안넣으면은
    # 어떤 에러가 나기만 하면은 통과가 되는 식임.
    expect { some_method }.to raise_error
  end

  it 'can check specific error' do
    expect { some_method }.to raise_error(NameError)
    expect { 10 / 0 }.to raise_error(ZeroDivisionError)
  end

  it 'can check user-create error' do
    # 이런식으로 그냥 raise를 바로 써도 되네.
    # 그냥 {} 안에는 코드가 들어간다고 생각하면 된다.
    # 특정 메소드호출 같은것이 아니여도 된다는 말이다.
    # do end를 써도 된다고 했으니까 이것도 실험해보자.
    expect { raise CustomError }.to raise_error(CustomError)
  end

  it 'can check user-create error do end version' do

    # 이것도 통과가 되긴하는데
    # 뭔가 이상하게 느껴지긴 하다. 왠만하면 위에껄로 하자.
    # method를 만들던지 해서 위 예시처럼 만드는게 개인적으로 깔끔하게 느껴지는 것 같다.
    expect do
      raise CustomError
    end.to raise_error(CustomError)
  end
end
