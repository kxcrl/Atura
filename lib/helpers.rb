module Chingu
  module Helpers
    module GameObject
      def load_game_objects(space, options = {})
        file = options[:file] || self.filename + ".yml"
        debug = options[:debug]
        except = Array(options[:except]) || []

        require 'yaml'

        puts "* Loading game objects from #{file}" if debug
        if File.exists?(file)
          objects = YAML.load_file(file)
          objects.each do |object|
            object.each_pair do |klassname, attributes|
              begin
                klass = Object
                names = klassname.split('::')
                names.each do |name|
                  klass = klass.const_defined?(name) ? klass.const_get(name) : klass.const_missing(name)
                end
                unless klass.class == "GameObject" && !except.include?(klass)
                  puts "Creating #{klassname.to_s}: #{attributes.to_s}" if debug
                  object = klass.create(space, attributes)
                  object.options[:created_with_editor] = true if object.options
                end
              rescue
                puts "Couldn't create class '#{klassname}'"
              end
            end
          end
        end
      end
    end
  end
end
