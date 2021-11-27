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

actor = Actor.new('Brad Pitt')
movie = Movie.new(actor)
movie.start_shooting
