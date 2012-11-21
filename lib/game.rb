class Game < Chingu::Window
  def initialize
    super SCREEN_WIDTH, SCREEN_HEIGHT, FULLSCREEN

    self.caption = "Atura"
    self.input = {esc: :exit}
  end

  def setup
    Gosu::enable_undocumented_retrofication
    switch_game_state(Level.new)
  end
end
