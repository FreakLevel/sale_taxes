require 'optparse'
require_relative './lib/main'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: run.rb [option]'
  opts.on('-f', '--file-path=STRING', String) do |f|
    options[:filepath] = f
  end
end.parse!

if options[:filepath].nil?
  p "add arg '-f' or '--file-path' with the file path of the input game"
  return
end

main = Main.new(options[:filepath])
main.run
