class Player < Chingu::GameObject
  attr_accessor :body, :shape

  def initialize(space, options={})
    self.input = {holding_right: :move_right, holding_left: :move_left}
    @space = space

    super(options)

    @image = Image["player.png"]
    init_physics
  end

  def init_physics
    body = CP::Body.new(10.0, 150.0)

    vertices = [
      CP::Vec2.new(-25.0, -25.0),
      CP::Vec2.new(-25.0, 25.0),
      CP::Vec2.new(25.0, 1.0),
      CP::Vec2.new(25.0, -1.0) ]

    @shape = CP::Shape::Poly.new(
      body, vertices, CP::Vec2.new(0,0))

    @shape.body.p = CP::Vec2.new(x, y)
    @shape.collision_type = :player
    @shape.object = self

    @space.add_body @shape.body
    @space.add_shape @shape
  end

  def move_left
  end

  def move_right
  end

  def update
    super
    self.x, self.y = @shape.body.p.x, @shape.body.p.y
  end

end
