class GameWindow < Gosu::Window
  def initialize
    super 1280, 800, false
    self.caption = "Atura"

    @background_image = Gosu::Image.new(self, "media/bg.jpg", true)
    @player = Player.new(self)
    @player.warp(320, 240)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.accelerate('left')
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.accelerate('right')
    end
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
