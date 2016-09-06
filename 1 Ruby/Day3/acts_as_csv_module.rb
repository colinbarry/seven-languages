# Modify the CSV application to support an each method to return a CsvRow object.

class CsvRow
    def initialize(headers, row)
        @headers = headers
        @row = row
    end
    
    def method_missing name, *args
        index = @headers.find_index(name.to_s)
        @row[index]
    end
end

module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
    
    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end
        
    module InstanceMethods
        def each
            csv_contents.each {|row| yield CsvRow.new(@headers, row)} 
        end
        
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')
            
            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end 
        end
        
        attr_accessor :headers, :csv_contents
        def initialize
            read
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

# Test the module
csv = RubyCsv.new
csv.each {|row| puts row.one}