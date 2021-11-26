# frozen_string_literal: true

RSpec.describe 'include matcher' do

  describe 'hot chocolate' do
    it 'check for substring inclusion' do
      expect(subject).to include('hot')
      expect(subject).to include('choc')
      expect(subject).to include('late')
    end

    it { is_expected.to include('chocolate') }
  end

  describe [10, 20, 30] do
    it 'checks for inclusion in the array, regardless of order' do
      expect(subject).to include(20)
      expect(subject).to include(10)
      expect(subject).to include(30, 20)
    end
  end

  describe ({ a: 2, b: 4}) do
    it 'can check for key existence' do

      # 이렇게 키가 존재하는지 확인할 수 있다.
      # 이건 have_attributes랑 같은거 아닌가.
      expect(subject).to include(:a)
      expect(subject).to include(:a, :b)
      expect(subject).to include(:b, :a)
    end

    it 'can check for key-value pair' do

      # 이게 include를 have_attribues 대신에
      # 사용할 수 있는 사용 예시인 것 같다.
      expect(subject).to include(a: 2)
    end

    it { is_expected.to include(:b) }
    it { is_expected.to include(b: 4)}
  end
end
