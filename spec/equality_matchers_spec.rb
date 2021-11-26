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

  describe 'equal and be matcher' do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    # equality and identity 를 비교하는 것이 핵심이라고 보면 됨.
    # equality는 값이 같으면 같게 나오는 것이고 identity는 완전히 같은 객체여야 한다는 것이다(같은 메모리를 지칭하고 있어야 한다.)

    it 'cares about object identity' do

      # eq, eql은 값이 같으면 같다고 하는건데
      # 둘의 차이는 아까 봤듯이 type을 cheking 하냐 아니냐의 차이지만.
      expect(c).to eq(d)
      expect(c).to eql(d)

      # equal은 실제로 메모리상의 같은 객체를 가리키고 있어야 한다는 것이 차이임.
      # 뭐 이것을 얼마나 쓸지는 모르겠다 보통은 값 비교를 하기 때문이겠찌
      # 또한 equal과 be는 완전히 같다는 것을 알면 된다.
      expect(c).to equal(e)
      expect(c).to be(e)

      expect(c).not_to equal(d)
    end

  end

end
