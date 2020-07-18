class PRLS::CLI::PRO

    attr_accessor :title, :author, :summary, :blurb, :url

    def initialize(attributes)
        attributes.each do |key, val|
            self.send("#{key}=", val) if self.respond_to?("#{key}=")
        end
    end

    def add_attr(hash)
        hash.each do |key, val|
            self.send("#{key}=", val) if self.respond_to?("#{key}=")
        end
        self
    end

    def add_attr_array(array)
        attr_hash = {
            :author => array[0],
            :summary => array[1],
            :blurb => array[2]
        }
        add_attr(attr_hash)
    end

    def need_attr?
        self.instance_variables.size < 5 ? true : false        
    end

    def self.new_from_scrape(array)
        array.each { |data| self.new(data) }
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
        puts "To return to the PROs menu, type 'pros'."
        puts "To exit, type 'exit'."
        puts ""
        choice = gets.chomp
        if choice.downcase == 'pros'
            PRLS::CLI.session.call
        elsif choice.downcase == 'exit'
            puts 'Exiting...'
            exit
        end
        while choice.to_i <= 0 || choice.to_i > self.all.size
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
        if self.all[index].author == nil || self.all[index].author == ""
            puts "#{self.all[index].title} by Anonymous/Unknown"
        else
            puts "#{self.all[index].title} by #{self.all[index].author}"
        end
        puts ""
        puts "SUMMARY"
        puts ""
        if self.all[index].summary == nil || self.all[index].summary == ""
            puts "No summary found."
        else
            puts self.all[index].summary.split.join(' ').wrap
        end
        puts ""
        puts "REVIEWS"
        puts ""
        if self.all[index].blurb == nil || self.all[index].blurb == ""
            puts "No reviews found."
        else
            puts self.all[index].blurb.split.join(' ').wrap
        end
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
