class Player < Chingu::GameObject
  traits :effect, :velocity

  def initialize(options={})
    super(options)
    @image = Image["player.png"]
    self.input = {holding_right: :accelerate_right, holding_left: :accelerate_left}
    self.max_velocity = 15
  end

  def accelerate_left
    self.velocity_x = Gosu::offset_x(270, 0.5)*self.max_velocity_x
  end

  def accelerate_right
    self.velocity_x = Gosu::offset_x(90, 0.5)*self.max_velocity_x
  end

  def update
    self.velocity_x *= 0.82
    @x %= $window.width
  end
end
