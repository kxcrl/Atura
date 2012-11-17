class Game < Chingu::Window
  def initialize
    super 1280, 800, false

    self.caption = "Atura"
    self.input = {esc: :exit}
  end

  def setup
    retrofy
    switch_game_state(Demo.new)
  end
end
