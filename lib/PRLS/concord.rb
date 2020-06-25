class PRLS::CLI::CONCORD < PRLS::CLI::PRO
    
    CONCORD_PLAYS = []

    def initialize(attributes)
        super
        CONCORD_PLAYS << self
    end

    def self.all
        CONCORD_PLAYS
    end

    def self.list_plays
        self.reset_all
        self.new_from_scrape(PRLS::CLI::Scraper.new.concord_index("https://www.concordtheatricals.com/perform/plays"))
        puts ""
        puts "Here are Concord Theatrical's featured plays:"
        super
    end

    def self.play_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.concord_info(self.all[index].url))
        super
    end

end
