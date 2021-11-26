# frozen_string_literal: true

RSpec.describe 'not_to method' do
  it 'checks that two values do not match' do
    # .to eq의 반대라고 생각하면 됨.
    # 어려운 개념 아니쥬.
    # 영어 생각하면 쉽게 형태를 알 수 있음.
    expect(5).not_to eq(4)
    expect('Hello').not_to eq('hello')
    expect([1, 2, 3]).not_to eq([1, 2])
  end
end