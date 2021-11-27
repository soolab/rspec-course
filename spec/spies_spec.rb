# frozen_string_literal: true

RSpec.describe 'spies' do
  let(:animal) { spy('animal') }

  it 'confirms that a message has been received' do

    # received 처럼 함수를 호출했냐 안했냐를 테스트하기 위해서 하는 거임.
    # 둘은 굉장히 비슷한데 차이점은 receive는 실제로 호출하기 전에 expect문을 작성해야 하고
    # spy를 사용할 경우에는 아래의 코드처럼 호출한 후에 expect문을 작성한다는 것이 가장 큰 차이임.
    # 그 외로 have_received라는 것이 syntax적으로 차이가 있다고 생각하면 됨.
    animal.eat_food
    expect(animal).to have_received(:eat_food)
    expect(animal).not_to have_received(:human)
  end

  it 'resets between examples' do
    expect(animal).not_to have_received(:eat_food)
  end

  it 'retains the same functionality of a regular double' do
    animal.eat_food
    animal.eat_food
    animal.eat_food('Sushi')

    # 아래와 같이 응용해서 사용하면 된다.
    # receive랑 비슷한 사용법을 가지고 있기 때문에
    # 둘 중 하나만 잘 알더라도 활용할 수 있을 것이다.
    # 취향에 따라서 갈릴 것 같긴 하다.
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with('Sushi')
    expect(animal).to have_received(:eat_food).once.with('Sushi')
  end
end
