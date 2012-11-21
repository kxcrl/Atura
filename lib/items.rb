# Work in progress...

class Platform < Chingu::GameObject
  attr_accessor :body, :shape, :space

  # Prevents saving with the editor, however
  # you can now load objects into chipmunk from
  # the level.yml files.
  def initialize(space, options={})
    @space = space
    super(options)

    @image = Image["platform.png"]
    init_physics
  end

  # Fallback for testing
  # def setup
  #   @image = Image["platform.png"]
  # end

  # Removes new platforms from the editor
  def init_physics
    @body = CP::Body.new(INFINITY, INFINITY)


    vertices = [
      CP::Vec2.new(-200.0, -20.0),
      CP::Vec2.new(-200.0, 20.0),
      CP::Vec2.new(200.0, 20.0),
      CP::Vec2.new(200.0, -20.0) ]

    @shape = CP::Shape::Poly.new(
      @body, vertices, CP::Vec2.new(0,0))

    @shape.body.p = CP::Vec2.new(x, y)
    @shape.e = 0
    @shape.u = 1
    @shape.collision_type = :platform
    @shape.object = self

    # Breaks the editor even more
    @space.add_static_shape(@shape)
  end

  def update
    super
    self.x, self.y = @shape.body.p.x, @shape.body.p.y
  end
end
