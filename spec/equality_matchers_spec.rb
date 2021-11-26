# frozen_string_literal: true

RSpec.describe 'equality matchers' do

  let(:a) { 3.0 }
  let(:b) { 3 }

  # 과연 둘은 같게 나올까??에 대한 질문이다.
  # a는 float, b는 integer이다.

  describe 'eq matcher' do
    it 'tests for value and ignores type' do

      # eq method는 타입을 따지지 않는다.
      # javascript의 ==와 비슷하달까??
      expect(a).to eq(3.0)
      expect(b).to eq(3)
      expect(a).to eq(b)
    end
  end

  describe 'eql matcher' do
    it 'tests for value, including same type' do

      # eql method는 타입을 따진다
      # javascript의 ===와 비슷하달까??
      expect(a).not_to eql(b)
      expect(b).not_to eql(a)

      expect(a).to eql(3.0)
      expect(b).to eql(3)
    end
  end

end
