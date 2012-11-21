class Player < Chingu::GameObject
  attr_accessor :body, :shape

  def initialize(space, options={})
    super(options)

    self.input = {
      holding_right: :move_right,
      holding_left: :move_left,
      holding_up: :jump}


    @space = space

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
    # @shape.body.v = CP::Vec2.new(15, 0)
    # @shape.body.apply_force(CP::Vec2.new(100,0), CP::Vec2.new(0,0))
    @shape.collision_type = :player
    @shape.object = self

    @space.add_body @shape.body
    @space.add_shape @shape
  end


  def move_left
    @shape.body.slew(CP::Vec2.new((@shape.body.p.x - 10), (@shape.body.p.y + @shape.body.v.y)), 1)
    # @shape.body.v = CP::Vec2.new(-5, @shape.body.v.y)
    # @shape.body.v = CP::Vec2.new(-5, @shape.body.v.y)
    # @shape.body.apply_force(CP::Vec2.new(-100, 0), CP::Vec2.new(0, 0))
    # @shape.body.reset_forces
    # @shape.body.f = CP::Vec2.new(0,-10000)
  end

  def move_right
    @shape.body.slew(CP::Vec2.new((@shape.body.p.x + 10), (@shape.body.p.y + @shape.body.v.y)), 1)
    # @shape.body.slew(CP::Vec2.new((@shape.body.p.x + 5), (@shape.body.p.y + 9.8)), 1)
  end

  def jump
    if @shape.body.v.y < 0.4 && @shape.body.v.y > -0.4
      @shape.body.slew(CP::Vec2.new((@shape.body.p.x + @shape.body.v.x), (@shape.body.p.y - 50 + @shape.body.v.y)), 1)
    end
  end

  def update
    super
    self.x, self.y = @shape.body.p.x, @shape.body.p.y
    @shape.body.v.x *= 0.8
    # @shape.body.v = CP::Vec2.new(10, 0)
  end

end
