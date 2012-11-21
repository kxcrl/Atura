class Player < Chingu::GameObject
  attr_accessor :body, :shape

  def initialize(space, options={})
    self.input = {
      holding_right: :move_right,
      holding_left: :move_left}


    @space = space

    super(options)

    @image = Image["player.png"]
    init_physics
  end

  def init_physics
    body = CP::Body.new(10, 150.0)

    vertices = [
      CP::Vec2.new(-25.0, -10.0),
      CP::Vec2.new(-25.0, 10.0),
      CP::Vec2.new(25.0, 10.0),
      CP::Vec2.new(25.0, -10.0) ]

    @shape = CP::Shape::Poly.new(
      body, vertices, CP::Vec2.new(0,0))

    @shape.body.p = CP::Vec2.new(x, y)
    @shape.body.v = CP::Vec2.new(0, 0)
    @shape.collision_type = :player
    @shape.object = self

    @space.add_body @shape.body
    @space.add_shape @shape
  end


  def move_left
    # @shape.body.slew(CP::Vec2.new(0,-1000), 1)
    @shape.body.v = CP::Vec2.new(0, -5)
    # @shape.body.apply_force(CP::Vec2.new(0, -10000), CP::Vec2.new(0,0))
    # @shape.body.reset_forces
    # @shape.body.f = CP::Vec2.new(0,-10000)
  end

  def move_right
  end

  def update
    super
    # @shape.body.v = CP::Vec2.new(0, -5)
    self.x, self.y = @shape.body.p.x, @shape.body.p.y
  end

end
