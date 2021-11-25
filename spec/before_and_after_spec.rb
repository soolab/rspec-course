# frozen_string_literal: true

RSpec.describe 'before and after hooks' do

  # :context를 사용하게 되면은
  # 이 케이스의 같은 경우는 전체에 한 번씩 걸리는 것으로 이해하면 되는데
  # context method와는 관계가 없는 것인 걸까?? 잘 모르겟다 테스트를 한 번 해보도록 하자.
  before(:context) do
    puts "Before context"
  end

  after(:context) do
    puts "Before context"
  end

  before(:example) do
    puts "Before example"
  end

  # 각각의 it 테스트의 마지막에 붙는다고 생각하면 된다.
  # 그런데 after는 어떤 식으로 활용하는것이 좋을까??
  after(:example) do
    puts "After example"
  end

  it 'is just a random example' do
    expect(5*4).to eq(20)
  end

  it 'is just a random example' do
    expect(3 - 2).to eq(1)
  end
end