require 'gosu'

# Add all subfolders to the load path
app_dir = File.expand_path(File.dirname(__FILE__))
sub_dirs = Dir.glob(app_dir + '/**/').select { |f| File.directory? f }
$:.push(*sub_dirs)  

# Reqire all ruby files in the load path
sub_dirs.each do |d|
  Dir.entries(d).each { |r| require r if r =~ /\.rb$/ }
end

window = GameWindow.new
window.show
