class PRLS::CLI::CONCORD < PRLS::CLI::PRO
    
    CONCORD_PLAYS = []

    def initialize(attributes)
        super
        CONCORD_PLAYS << self
    end

    def self.all
        CONCORD_PLAYS
    end

    def self.get_plays
        url = "https://www.concordtheatricals.com/perform/plays"
        self.new_from_scrape(PRLS::CLI::Scraper.new.concord_index(url))
    end

    def self.list_plays
        puts ""
        puts "Loading..."
        puts ""
        puts "Here are Concord Theatrical's featured plays:"
        super
    end

    def self.get_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.concord_info(self.all[index].url))
    end

end
