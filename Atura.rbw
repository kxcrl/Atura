require 'gosu'
require 'chingu'
require 'chipmunk'

include Gosu
include Chingu

# Set Constants
SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 800
FULLSCREEN = false
TIMESTEP = 1.0 / 20.0
SUBSTEPS = 10
INFINITY = 1.0 / 0.0
LEVEL = 'demo'

# Add all subfolders to the load path
app_dir = File.expand_path(File.dirname(__FILE__))
sub_dirs = Dir.glob(app_dir + '/**/').select { |f| File.directory? f }
$:.push(*sub_dirs)  

# Reqire all ruby files in the load path
sub_dirs.each do |d|
  Dir.entries(d).each { |r| require r if r =~ /\.rb$/ }
end

Game.new.show
