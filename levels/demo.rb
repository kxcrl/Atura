class Demo < GameState
  def initialize(options = {})
    super
    self.input = {e: :edit}

    @file = File.join(ROOT, "levels", self.filename + ".yml")
    load_game_objects(file: @file)

    @player = Player.create(zorder: 2, x: 420, y: 340)
    @background = Image["bg.jpg"]
  end

  def edit
    state = GameStates::Edit.new(file: @file, except: Player)
    push_game_state(state)
  end

  def draw
    super
    @background.draw(0,0,0)
  end
end
