# Work in progress...

class Platform < Chingu::GameObject
  attr_accessor :body, :shape, :space

  # Prevents saving with the editor, however
  # you can now load objects into chipmunk from
  # the level.yml files.
  def initialize(space, options={})
    super(options)

    @space = space

    @image = Image["platform.png"]
    init_physics
  end

  # Fallback for testing
  # def setup
  #   @image = Image["platform.png"]
  # end

  # Removes new platforms from the editor
  def init_physics
    body = CP::Body.new(INFINITY, INFINITY)


    vertices = [
      CP::Vec2.new(-190.0, -24.0),
      CP::Vec2.new(-190.0, 24.0),
      CP::Vec2.new(190.0, 24.0),
      CP::Vec2.new(190.0, -24.0)
      ]

    @shape = CP::Shape::Poly.new(
      body, vertices, CP::Vec2.new(0,0))

    @shape.body.p = CP::Vec2.new(x, y)
    @shape.e = 1.0
    @shape.u = 1
    @shape.collision_type = :platform
    @shape.object = self

    # Breaks the editor even more
    @space.add_static_shape(@shape)
  end

  # def update
  #   super
  #   self.x, self.y = @shape.body.p.x, @shape.body.p.y
  # end
end

#Bullets fired by our hero

class PlayerBullet < Chingu::GameObject
  trait :timer
  attr_accessor :body, :shape, :space

  def intialize(space, options={})
    super(options)
    @space = space
    init_physics
  end

  def init_physics
    @color = Gosu::white

    # @angle = Gosu::angle.new(
    #   @player.body.shape.x,
    #   @player.body.shape.y,
    #   $window.mouse_x,
    #   $window.mouse_y)

    body = CP::Body.new(1.0, 150)

    vertices = [
      CP::Vec2.new(-2, 1),
      CP::Vec2.new(2, -1),
      CP::Vec2.new(-2, -1),
      CP::Vec2.new(2, 1) ]

    @shape = CP::Shape::Poly.new(
      body, vertices, CP::Vec2.new(0, 0))

    @shape.collision_type = :bullet
    @shape.object = self
    @shape.body.p = CP::Vec2.new(@player.shape.body.x, @player.shape.body.y)
    @shape.body.v = CP::Vec2.new(
      ($window.mouse_x - @player.shape.body.x),
      ($window.mouse_y - @player.shape.body.y))

    @space.add_body @shape.body
    @space.add_shape
  end

  def update
    super
    self.x, self.y = @shape.body.p.x, @shape.body.p.y
  end

end









