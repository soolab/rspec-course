# frozen_string_literal: true

class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    # 3초 동안 잠자도록 만드는 것임.
    # 이걸 쓸일은 별로 없을 것 같긴 함.
    sleep(3)
    true
  end

  def act
    'I love you'
  end

  def fall_off_ladder
    'Call my agent! No way!'
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if actor.ready?
      actor.act
      actor.fall_off_ladder
      actor.light_on_fire
    end
  end
end

# actor = Actor.new('Brad Pitt')
# movie = Movie.new(actor)
# movie.start_shooting

RSpec.describe Movie do

  # movie라는 것은 멤버로 actor를 필요로 하다.
  # 하지만 직접 actor를 만들고 싶지는 않다.
  # 위의 예시를 따르면은 sleep이라는 것은 꽤나 무거운 기능이라서 그렇다고 치자.
  # movie를 테스트 하기 위해서는 act, fall_off_ladder, light_on_fire라는 메소드가 있는 오브젝트만 있으면 된다는 것임.
  # 어떻게 보면은 인터페이스만 만들어주면 된다는 것임. method의 implement가 어떻게 되어있는지는 관심이 없다는 것임.

  # 근데 실제로 이렇게 Mocking 해야 하는 경우가 어떤건지는 잘 모르겠음.
  # 위의 예시대로 너무 무거운 object라고 가정하더라도.
  # 비지니스 로직을 체크해야 하지 않나. 단순히 인터페이스만 제공하는 것이라면 어떤 테스트를 하려고 하는 것일까??
  let(:stuntman) do
    double('Mr. Danger', ready?: true, act: 'Any string at all', fall_off_ladder: 'Sure! lets do it', light_on_fire: true)
  end

  subject { described_class.new(stuntman) }

  describe '#start_shooting method' do

    # 여기에서는 단순히 그 메소드를 호출하느냐를 테스트하려고 하는 것 같음.
    it 'expects an actor to do 3 actions' do

      # subject가 start_shooting을 하기 전에
      # 이러한 상황들을 기대한다고 설정해야 한다.
      # mock이 왜 쓰이는지 알 것 같다.
      # if 나 else 같은 것으로 로직이 변경될때,
      # 실행되어야 하는 메소드들이 변경될 수 있는데 그러한 상황에서
      # 메소드 호출을 테스트해볼 수 있다는 것 같다.

      # 실제로 actor를 넣기에는 좀 부담스럽고
      # 메소드 호출되는것은 확인하고 싶고 그럴 때
      # 이렇게 mocking해서 사용하면 좋다는 것 같다.
      expect(stuntman).to receive(:ready?)
      expect(stuntman).to receive(:act)
      expect(stuntman).to receive(:fall_off_ladder)
      expect(stuntman).to receive(:light_on_fire)

      subject.start_shooting
    end
  end



end







