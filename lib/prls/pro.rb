class PRLS::CLI::PRO

    attr_accessor :title, :author, :summary, :blurb, :url

    def initialize(attributes)
        attributes.each { |key, val| self.send("#{key}=", val) if self.respond_to?("#{key}=") }
        self.class.all << self
    end

    def add_attr(hash)
        hash.each { |key, val| self.send("#{key}=", val) if self.respond_to?("#{key}=") }
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
        self.instance_variables.size < 5    
    end

    def self.new_from_scrape(array)
        array.each { |data| self.new(data) }
    end

    def self.get_plays
        puts ""
        puts "Loading..."
        puts ""
    end

    def self.list_plays
        puts ""
        self.all.each.with_index { |play, index| puts "#{index + 1}. #{play.title}" }
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
    end

    def self.list_details(index)
        puts ""
        puts "TITLE"
        puts ""
        self.all[index].author.empty? ? (puts "#{self.all[index].title} by Anonymous/Unknown") : (puts "#{self.all[index].title} by #{self.all[index].author}")
        puts ""
        puts "SUMMARY"
        puts ""
        self.all[index].summary.empty? ? (puts "No summary found.") : (puts self.all[index].summary.split.join(' ').wrap)
        puts ""
        puts "REVIEWS"
        puts ""
        self.all[index].blurb.empty? ? (puts "No reviews found.") : (puts self.all[index].blurb.split.join(' ').wrap)
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
