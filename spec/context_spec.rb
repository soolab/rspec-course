# frozen_string_literal: true

RSpec.describe '#even? method' do
  # it 'should return true if number is even'
  # it 'should return false if number is odd'

  # 원래는 위와 같이 작성해야 할 것을
  # describe 또는 context라는 것을 통해서
  # 분리할 수 있다는 것임. 만약에 너무 많은 if문을 사용하고 있다면
  # 이렇게 보기 쉽게 정리하면 더 좋다는 것임
  # 추가적으로 describe와 context는 내부적으로는 같은 것이니까
  # 별로 신경쓰지 않아도 된다.

  # 그리고 추가적으로는 describe를 사용한다고 그것에 특별한 scope가 생기는 것은 아닌 것 같음
  # 그냥 감싸주는 역할이긴 한데 it 단위로 지역 변수들이 생겨난다고 생각하면 될 것 같다.
  # 나는 이것을 오해하고 있었던 것 같다.

  describe 'with even number' do
    it 'should return true' do
      expect(4.even?).to eq(true)
    end
  end

  describe 'with odd number' do
    it 'should return false' do
      expect(5.even?).to eq(false)
    end
  end
end
