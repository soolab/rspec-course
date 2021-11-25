class ProgrammingLanguage

  attr_reader :name

  def initialize(name = 'Ruby')
    @name = name
  end

end

RSpec.describe ProgrammingLanguage do
  let(:language) { ProgrammingLanguage.new('Python') }

  it 'should store the name of the language' do
    expect(language.name).to eq('Python')
  end

  context 'with no argument' do

    # something은 with no argument context 에서 정의된 것이기 떄문에
    # 위에서는 적용될 수 없다는 것이다.
    # 위에서 적용되려면은 위에 있는 테스트케이스를 내리거나
    # something을 위로 올리면 된다는 것이다.
    let(:something) { 1 }

    # 바로 밑에것이 없었다면은 위에 있는 language가 적용되었을 것이지만
    # 여기에서 overwriting을 했다는 것이다.
    # 왜냐면 그냥 가장 가까이에 있는 것을 통해 참조한다고 생각하면 될 것 같다.

    let(:language) { ProgrammingLanguage.new }

    it 'should default to Ruby as the name' do
      expect(language.name).to eq('Ruby')
    end

  end
end