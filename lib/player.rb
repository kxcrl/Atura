class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "media/player.png", false)
    @x = @y = @vel_x = @vel_y = @angle=  0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def accelerate(direction)
    case direction
    when 'left'
      @vel_x += Gosu::offset_x(270, 0.5)
    when 'right'
      @vel_x += Gosu::offset_x(90, 0.5)
    end
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1280
    @y %= 800

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
