RSpec.describe 'nested hooks' do

  # block안에서 한 번 씩만 실행되는 것이
  # :context 라고 생각하면 되는데
  # 이떄의 block은 전체를 의미하는 것임
  # 근데 이건 맨 위에 있으니까 진짜 딱 한 번만 실행되는 것임
  # 말 그대로 Outer 라고 생각하면 된다.
  before(:context) do
    puts "Outer Before context"
  end

  after(:context) do
    puts "Outer After context"
  end

  before(:example) do
    puts "Outer before example hook"
  end

  after(:example) do
    puts "Outer after example hook"
  end

  it 'does basic math' do
    expect(1 + 1).to eq(2)
  end

  context 'with condition A' do

    # 이건 말 그대로 Inner context라서
    # context 안에서 딱 한 번만 실행된다고 생각하면 된다.
    # 즉, 적용되는 scope이 달라질 수 있다는 것이다.
    before(:context) do
      puts "Inner Before context"
    end

    after(:context) do
      puts "Inner After context"
    end

    before(:example) do
      puts "Inner example before hook"
    end


    after(:example) do
      puts "Inner example after hook"
    end

    it 'does some more basic math' do
      expect(1 + 1).to eq(2)
    end

    it 'does some more basic math' do
      expect(5 - 3).to eq(2)
    end

  end
end
