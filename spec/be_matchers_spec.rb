# frozen_string_literal: true

# Truthy -> string, number, array.. falsy를 제외한 모든것이라고 생각하면 쉽다.
# 숫자 0도 truthy가 된다는 것을 유의하자.
# javascript나 다른 언어를 사용했다면은 흔히 저지를 수 있는 실수이다.
# Falsy -> false, nil

RSpec.describe 'be matchers' do
  it 'can test for truthiness' do
    expect(true).to be_truthy
    expect('Hello').to be_truthy
    expect(5).to be_truthy
    expect(0).to be_truthy
    expect(-1).to be_truthy
    expect([]).to be_truthy
    expect({}).to be_truthy
    expect(:symbol).to be_truthy
  end

  it 'can test for falsiness' do
    expect(false).to be_falsy
    expect(nil).to be_falsy
  end

  it 'can test for nil' do
    expect(nil).to be_nil

    my_hash = { a: 5 }
    expect(my_hash[:b]).to be_falsy
    expect(my_hash[:b]).to be_nil
  end
end

