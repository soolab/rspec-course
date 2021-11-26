# frozen_string_literal: true

RSpec.describe 'contain_exactly matcher' do
  subject { [1, 2, 3] }

  describe 'long form syntax' do
    it 'should check for the presence of all elements' do

      # contain 하냐를 보는건데
      # 아래의 세 가지는 모두 통과를 한다.
      # 이를 통해 알 수 있는 것은 contain_exactly는 순서를 따지지 않는다는 것이다.
      expect(subject).to contain_exactly(1, 2, 3)
      expect(subject).to contain_exactly(3, 2, 1)
      expect(subject).to contain_exactly(3, 1, 2)

    end
  end
end
