# frozen_string_literal: true

# 이번에는 shared_context이다!!
# 사실 RSpec이 제공하는 context method와는 별로 관계가 없는 것 같고
# 이것도 마찬가지고 중복을 줄이기 위해서 만들었다고 생각하면 됨.
# 기본적으로 shared_~는 중복되는 것을 줄이기 위함임.

# 이것도 비슷하게 shared_context에서 제공하는 코드들이
# include_context를 하면 삽입된다는 개념으로 이해해도 괜찮을 것 같다.

# 아래와 같이 before, def, let 같은 것들을 미리 정의해 놓는다고 생각하면 된다.
# 보통은 아마 다른 파일에다가 shared_context나 shared_examples를 만들어놓고
# 당겨서 사용한다고 보면 될 것 같다. 그게 파일을 분리할 때 더 깔끔하기 때문이다.

# 다만 아쉬운건 정의할떄도 그렇고 include를 할떄도 그렇고
# 문자열 기반으로 매칭한다는 것이 좀 아쉽다. 오타나면은 안될 것이기 때문이다.

RSpec.shared_context 'common' do
  before(:example) do
    @foods = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3] }
end

RSpec.describe 'first example group' do
  include_context 'common'

  it 'can use outside instance variable' do
    expect(@foods.length).to eq(0)
    @foods << 'Sushi'
    expect(@foods.length).to eq(1)
  end

  it 'can reuse instance variables across different examples' do
    expect(@foods.length).to eq(0)
  end

  it 'can use shared helper methods' do
    expect(some_helper_method).to eq(5)
  end
end

RSpec.describe 'second example group in different file' do
  include_context 'common'

  it 'can use shared let variables' do
    expect(some_variable).to eq([1, 2, 3])
  end
end
