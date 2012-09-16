
# Prompt!
Pry.config.prompt = proc do |_, level, pry| 
  tree = pry.binding_stack.map { |b| Pry.view_clip(b.eval("self")) }.join " / "
  "(pry) #{tree}: #{level}>"
end

# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false
Pry.plugins["doc"].activate!

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# Sample constants
MY_ARRAY = %w{this is a sample array}
MY_HASH = Hash["a", 100, "b", 200] 


# place this file in ~/.pryrc
#
# # vim FTW - you can use 'mate' or whichever your prefer
# Pry.config.editor = 'vim'
#
# Pry.config.hooks.add_hook :after_session, :say_bye do
#   puts "bye-bye" if Pry.active_sessions == 1
#   end
#
#   # Prompt with ruby version
#   Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]
#
#   # Toys methods
#   # See https://gist.github.com/807492
#   class Array
#     def self.toy(n=10, &block)
#         block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
#           end
#           end
#
#           class Hash
#             def self.toy(n=10)
#                 Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
#                   end
#                   end
#
#                   if defined?(Rails) && Rails.env
#                     require 'logger'
#
#                       ActiveRecord::Base.logger = Logger.new(STDOUT)
#                         ActiveRecord::Base.clear_active_connections!
#
#                           class Class
#                               def core_ext
#                                     self.instance_methods.map {|m| [m, self.instance_method(m).source_location] }.select {|m| m[1] && m[1][0] =~/activesupport/}.map {|m| m[0]}.sort
#                                         end
#                                           end
#                                           end
