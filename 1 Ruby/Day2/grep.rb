# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere
# in that line. If you want, include line numbers.

filename = "tree.rb"
expr = "node"

regexp = Regexp.new expr
File.open(filename, 'r') do |file|
    file.each { |line| puts "#{file.lineno}: #{line}" if regexp.match(line) }
end
