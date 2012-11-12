class GameWindow < Chingu::Window
  def initialize
    super 1280, 800

    self.caption = "Atura"
    self.input = {esc: :exit}

    @background = Image["bg.jpg"]
    @player = Player.create(zorder: 2, x: 420, y: 340)
  end

  def draw
    @player.draw
    @background.draw(0, 0, 0);
  end
end
