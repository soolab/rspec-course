# frozen_string_literal: true

RSpec.describe 'start_with and end_with matchers' do

  describe 'caterpillar' do
    it 'should check for substring at the beginning or end ' do
      expect(subject).to start_with('cat')
      expect(subject).to end_with('caterpillar')

    end
    it { is_expected.to start_with('cat') }
    it { is_expected.to end_with('caterpillar') }
  end

  describe [:a, :b, :c, :d] do
    it 'should check for elements at beginning or end of the array' do

      # start_with와 end_with는 string에서만 쓸 수 있는 줄 알았는데
      # array에서도 쓸 수 있구나. 뭐 이 정도 알면 됐음.
      expect(subject).to start_with(:a)
      expect(subject).to end_with(:d)
    end

    # is_expected는 생략하겠음.
    end
end
