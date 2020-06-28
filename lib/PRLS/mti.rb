class PRLS::CLI::MTI < PRLS::CLI::PRO
    
    MTI_PLAYS = []

    def initialize(attributes)
        super
        MTI_PLAYS << self
    end

    def self.all
        MTI_PLAYS
    end

    def self.get_plays
        url = "https://www.mtishows.com/shows/all"
        self.new_from_scrape(PRLS::CLI::Scraper.new.mti_index(url))
    end

    def self.list_plays
        puts ""
        puts "Here are Music Theatre International's featured plays:"
        super
    end

    def self.get_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.mti_info(self.all[index].url))
    end

end
