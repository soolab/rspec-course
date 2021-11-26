# frozen_string_literal: true

class ProfessionalWrestler

  attr_reader :name, :finishing_move

  def initialize(name, finishing_move)
    @name = name
    @finishing_move = finishing_move
  end
end

RSpec.describe 'have_attributes matcher' do

  # 오 이런식으로도 쓸 수 있네.
  # 객체를 아예 만들어버리고 이것을 subject로 사용하겠다는 거구나.
  # 이거 잘 사용하면 편하게 쓸 수 있을 것 같다는 생각이 든다.
  describe ProfessionalWrestler.new('Stone Cold Steve Austin', 'Stunner') do

    it 'checks for object attribute and proper values' do

      # key, value를 확인할때 쓰면 되는거군
      # class의 object나 hash에 사용하면 될 것 같다.
      expect(subject).to have_attributes(name: 'Stone Cold Steve Austin')
      expect(subject).to have_attributes(finishing_move: 'Stunner')
    end

    it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin') }
    it { is_expected.to have_attributes(finishing_move: 'Stunner') }
  end
end
