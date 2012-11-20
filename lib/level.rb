class Level < GameState
  attr_accessor :space, :player

  def initialize(options = {})
    super
    self.input = {e: :edit}

    @file = File.join(ROOT, "levels", LEVEL + ".yml")
    load_game_objects(file: @file)

    @background = Image["bg.jpg"]
    init_physics

    @player = Player.new(@space, x: 200, y: 20 )
  end

  def init_physics
    @space = CP::Space.new
    @space.damping = 0.5
    @space.gravity = CP::Vec2.new(0, 10)
  end

  def edit
    state = GameStates::Edit.new(file: @file, except: Player)
    push_game_state(state)
  end

  def update
    super
    @player.update
    SUBSTEPS.times do
      @player.shape.body.reset_forces
      @space.step(TIMESTEP)
    end
  end

  def draw
    super
    @background.draw(0,0,0)
    @player.draw
  end
end
