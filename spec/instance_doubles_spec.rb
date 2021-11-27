# frozen_string_literal: true

class Person
  def a
    sleep(3)
    'Hello'
  end
end

RSpec.describe Person do
  describe 'regular double' do
    it 'can implement any method' do

      # b라는 것은 사실 person에 있으면 안되는 것임.
      # 위의 class를 참고해보도록 하자, 거기에는 a라는 method밖에 없다.
      person = double(a:'Hello', b: 20)
      expect(person.a).to eq('Hello')
    end
  end

  describe 'instance double' do
    it 'can only implement methods that are defined on the class' do
      # 아래의 코드는 RSpec을 돌려보면은 에러가 난다.
      # 왜냐하면 b라는 method는 person instance의 object가 아니기 때문이다.
      # 이렇게 instance_double이라는 것을 사용하면은 위의 it과 같이 실제로 person에 존재하지 않는
      # b라는 method를 implement 하는 것을 방지 할 수 있다.
      # 그럼 앵간하면 instance_double을 사용하는게 맞는 것 같다. 보통 instance를 주로 Mocking 할 것이라고 생각하기 때문임.
      # person = instance_double(Person, a: 'Hello', b: 20)

      # 밑의 코드도 에러가 난다
      # 왜냐하면 a라는 method는 argument를 받을 수 없기 떄문이다.
      # instance_double은 class를 참조하여 implement를 좀 더 strict하게 감시하기 떄문이다.
      # person = instance_double(Person)
      # allow(person).to receive(:a).with(3,10).and_return('Hello')

      person = instance_double(Person, a: 'Hello')
      expect(person.a).to eq('Hello')
    end
  end
end
