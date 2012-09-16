require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8
# require 'irbtools'
# require 'irbtools/more'
# require 'interactive_editor'
# require 'ap'

# %w[irbtools irbtools/more interactive_editor ap ].each { |lib| require lib }
%w[interactive_editor awesome_print].each { |lib| require lib }

if ENV['RAILS_ENV']
  require 'hirb'
  require 'active_record'
  Hirb.enable
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# %x{gem install 'wirble' --no-ri --no-rdoc} unless Gem.available?('wirble')
# %x{gem install 'interactive_editor' --no-ri --no-rdoc} unless Gem.available?('interactive_editor')
# %x{gem install 'ap' --no-ri --no-rdoc} unless Gem.available?('ap')
# %x{gem install 'fancy_irb' --no-ri --no-rdoc} unless Gem.available?('fancy_irb')
# %x{gem install 'ori' --no-ri --no-rdoc} unless Gem.available?('ori')

# %w[ rubygems interactive_editor ap fancy_irb ori wirble].each { |lib| require lib }

# Gem.refresh
# FancyIrb.start

# IRB.conf[:PROMPT_MODE] = :DEFAULT

# alias q exit

# class Object
#   def local_methods
#     (methods - Object.instance_methods).sort
#   end
# end

# constants
# ANSI = {}
# ANSI[:RESET]     = "\e[0m"
# ANSI[:BOLD]      = "\e[1m"
# ANSI[:UNDERLINE] = "\e[4m"
# ANSI[:LGRAY]     = "\e[0;37m"
# ANSI[:GRAY]      = "\e[0;90m"
# ANSI[:RED]       = "\e[31m"
# ANSI[:GREEN]     = "\e[32m"
# ANSI[:YELLOW]    = "\e[33m"
# ANSI[:BLUE]      = "\e[34m"
# ANSI[:MAGENTA]   = "\e[35m"
# ANSI[:CYAN]      = "\e[36m"
# ANSI[:WHITE]     = "\e[37m"
# ARRAY = [1,2,3,4,5,6,7,8,9,10]
# ARRAY2 = %w[Ramones Johnny Joey DeeDee Marky]
# HASH = {1 => "a", 2 => "b", 3 => "c", 4 => "d", 5 => "e"}
# HASH1 = { "a" => 111, "b" => 222, "c" => 333 }
# HASH2 = { "c" => 333, "d" => 444, "e" => 555 }

# Build a simple colorful IRB prompt
# IRB.conf[:PROMPT][:SIMPLE_COLOR] = {
#   :PROMPT_I => "#{ANSI[:BLUE]}>>#{ANSI[:RESET]} ",
#   :PROMPT_N => "#{ANSI[:BLUE]}>>#{ANSI[:RESET]} ",
#   :PROMPT_C => "#{ANSI[:RED]}?>#{ANSI[:RESET]} ",
#   :PROMPT_S => "#{ANSI[:YELLOW]}?>#{ANSI[:RESET]} ",
#   :RETURN   => "#{ANSI[:GREEN]}=>#{ANSI[:RESET]} %s\n",
#   :AUTO_INDENT => true }
# IRB.conf[:PROMPT_MODE] = :SIMPLE


# def fence(size=50)  puts ("-") * size end

# pm - Print methods of objects in irb/console sessions.
# Goes in ~./irbrc 

#   begin Utility methods
#     def pm(obj, *options) Print methods
#       methods = obj.methods
#       methods -= Object.methods unless options.include? :more
#       filter = options.select {|opt| opt.kind_of? Regexp}.first
#       methods = methods.select {|name| name =~ filter} if filter

#       data = methods.sort.collect do |name|
#         method = obj.method(name)
#         if method.arity == 0
#           args = "()"
#         elsif method.arity > 0
#           n = method.arity
#           args = "(#{(1..n).collect {|i| "arg{i}"}.join(", ")})"
#         elsif method.arity < 0
#           n = -method.arity
#           args = "(#{(1..n).collect {|i| "arg{i}"}.join(", ")}, ...)"
#         end
#         klass = $1 if method.inspect =~ /Method: (.*?)/
#         [name, args, klass]
#       end
#       max_name = data.collect {|item| item[0].size}.max
#       max_args = data.collect {|item| item[1].size}.max
#       data.each do |item| 
#         print "#{ANSI[:LGRAY]}#{item[0].rjust(max_name)}#{ANSI[:RESET]}"
#         print "#{ANSI[:BLUE]}#{item[1].ljust(max_args)}#{ANSI[:RESET]}"
#         print "#{ANSI[:RED]}#{item[2]}#{ANSI[:RESET]}\n"
#       end
#       data.size
#     end
#   end


# begin
#   IRB::Irb.class_eval do
#     def output_value
#       ap @context.last_value
#     end
#   end
# rescue LoadError => e
#   puts "ap gem not found.  Try typing 'gem install awesome_print' to get super-fancy output."
# end

# unless IRB.version.include?('DietRB')
#   IRB::Irb.class_eval do
#     def output_value
#       ap @context.last_value
#     end
#   end
# else MacRuby
#   IRB.formatter = Class.new(IRB::Formatter) do
#     def inspect_object(object)
#       object.ai
#     end
#   end.new
# end

# def question(input)
#   case input
#   when 1
#     puts "\n -[ Create a basic string ]- \n\n"
#   when 2
#     puts "\n -[ Convert sting into an array ]- \n\n" 
#   when 3
#     puts "\n -[ Loop thru the array (single line technique) ]- \n\n" 
#   when 4
#     puts "\n -[ Loop thru the array (multiple line technique) ]- \n\n"
#   when 5
#     puts "\n -[ Loop thru the array using an iterator ]- \n\n"
#   when 6
#     puts "\n -[ Create a hash of the Ramones ]- \n\n"
#   when 7
#     puts "\n -[ Loop thru hash showing who plays which instrument ]- \n\n"
#   when 8
#     puts "\n -[ Blocks : Collect / Map example\n Generate an array of things to cover in chocolate.\nUsing map/or/collect, cover each item in chocolate. ]- \n\n"
#   when 9               
#     puts "\n -[ Blocks : Inject (use to sum numbers) ]- \n\n"
#   when 10
#     puts "\n -[ Blocks : Sort an Array ]- \n\n"    
#   when 11
#     puts "\n -[ Blocks : Merge 2 Hashes (verbose technique) ]- \n\n" 
#   when 12
#     puts "\n -[ Blocks : Merge 2 Hashes (concise technique) ]- \n\n" 
#   when 13
#     puts "\n -[ Blocks :  Find (find / detect ) ]- \n\n" 
#   when 14
#     puts "\n -[ Blocks :  Find (find_all / select ) ]- \n\n"
#   when 15
#     puts "\n -[ Blocks :  Find (any?) ]- \n\n" 
#   when 16
#     puts "\n -[ Blocks :  Find (all?) ]- \n\n" 
#   when 17
#     puts "\n -[ Blocks :  Find (delete_if) ]- \n\n" 
#   when 18
#     puts "\n -[ Subdomain Random Name Generator ]- \n\n" 
#   when 19
#     puts "\n -[ Define a Nested hash]"
#   when 20
#     puts "\n -[ Create a shorthand array using to_a and a range"
#   else
#     puts "valid input required"
#   end
# end

# def hint(question)
#   case question
#   when 1
#     puts "\nstr = \"This is a string\"\n\n"
#   when 2
#     puts "\nstrArray = str.split(\" \")                           # method 1\n\nclues = ['vitamins', 'minerals', 'chocolates']      # method 2\n\nclues = %w(vitamins minerals chocolates)            # method 3\n\nclues = Array.new                                   # method 4\nclues << 'vitamins'\nclues << 'minerals'\nclues << 'chocolates'\n\n"
#   when 3
#     puts "\nstrArray.each { |a| puts a }                        # method 1 - single line\n"
#   when 4
#     puts "\nmy_vitamins.each do |vitamin|                       # method 2 - multiline\n  puts \"\#{vitamin} is tasty!\"\nend\n\n"
#    when 5
#     puts "\nstrArray.each_with_index { |a,i| puts \"Index: \#{i} contains the word: \#{a}\" }\n\n"
#   when 6
#     puts "\nramones = {:guitar => 'Johnny', :vocals => 'Joey', :bass => 'Dee Dee', :drums => 'Marky'}\n\n"
#   when 7
#     puts "\nramones.each do |instrument,player|\n  puts \"\#{player} is on \#{instrument}\"\nend\n\n"
#   when 8
#     puts "\nnouns = ['truffle', 'kiss', 'rabbit']\n  array_of_chocolates = nouns.map do |noun|\n    \"chocolate \#{noun}\"\nend\n\n"
#   when 9
#     puts "\n[1, 2, 3, 4].inject(0) { |result, element| result + element }\n\n"
#   when 10
#     puts "\n[1, 4, 3, 7, 2, 9].sort\n\n"
#   when 11
#     puts "\nBasic Method\nh1 = { \"a\" => 111, \"b\" => 222 }\nh2 = { \"b\" => 333, \"c\" => 444 }\n\nputs \"Merged:  \#{h1.merge(h2).inspect}\"\n\n** BASIC TECHNIQUE **\n\n h1.merge(h2) do | key, old, new |\n  if old < new\n    old\n  else\n    new\n  end\nend\n\n"
#   when 12
#     puts "\nConcise Method\nh1.merge(h2) { | k,o,n | o < n ? o : n }"
#   when 13
#    puts "\n(1..10).detect{ | i | i % 3 == 0}\n\n(1..10).detect{ | i | (1..10).include?(i * 3)} "
#   when 14
#     puts "\n(1..10).find_all {|i| i % 3 == 0}\n\n"
#   when 15
#     puts "\n(1..10).any? { | i | i % 3 ==0 }\n\n"
#   when 16
#     puts "\n(1..10).all? { | i | i % 3 ==0 }\n\n"
#   when 17
#     puts "\n[*1..10].delete_if { | i | i % 3 == 0}\n\n"
#   when 18
#     puts "\n('a'..'z').to_a.shuffle[0..7].join"
#   when 19
#     puts "\nparams[:user] = { :name => \"Michael Hart\", :email => \"mhartl@example.com\" }"
#   when 20
#     puts "\na=(1..10).to_a"
#   else
#     puts "valid input required"
#   end
# end

# alias :h :hint
# alias :q :question
