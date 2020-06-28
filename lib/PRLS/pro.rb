class PRLS::CLI::PRO

    attr_accessor :title, :author, :summary, :blurb, :url

    def initialize(attributes)
        attributes.each do |key, val|
            self.send("#{key}=", val) if self.respond_to?("#{key}=")
        end
    end

    def self.new_from_scrape(array)
        array.each do |data|
            self.new(data)
        end
    end

    def add_attr(hash)
        hash.each do |key, val|
            self.send("#{key}=", val) if self.respond_to?("#{key}=")
        end
        self
    end

    def self.list_plays
        puts ""
        index = 0
        self.all.each do |play|
            puts "#{index + 1}. #{play.title}"
            index += 1
        end
        puts ""
        puts "Which play would you like to learn more about?"
        puts ""
        choice = gets.chomp
        while choice.to_i > self.all.size + 1
            puts "Invalid entry, please try again."
            choice = gets.chomp
        end
        self.get_details(choice.to_i - 1)
        self.list_details(choice.to_i - 1)
        choice = 0
    end

    def self.list_details(index)
        puts ""
        puts "TITLE"
        puts ""
        puts "#{self.all[index].title} by #{self.all[index].author}"
        puts ""
        puts "SUMMARY"
        puts ""
        if self.all[index].summary == nil || self.all[index].summary == ""
            puts "No summary found."
        end
        puts self.all[index].summary
        puts ""
        puts "REVIEWS"
        puts ""
        if self.all[index].blurb == nil || self.all[index].blurb == ""
            puts "No reviews found."
        end
        puts self.all[index].blurb
        puts ""
        puts "Learn more about #{self.all[index].title} here: #{self.all[index].url}"
        puts ""
        puts "Would you like to learn more about another play? Y/N"
        input = gets.chomp
        if input.downcase == 'y'
            puts ""
            self.list_plays
        end
    end

end
