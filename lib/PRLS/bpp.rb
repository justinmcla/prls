class PRLS::CLI::BPP < PRLS::CLI::PRO
    
    BPP_PLAYS = []

    def initialize(attributes)
        super
        BPP_PLAYS << self
    end

    def self.all
        BPP_PLAYS
    end

    def self.list_plays
        self.reset_all
        self.new_from_scrape(PRLS::CLI::Scraper.new.bpp_index("https://www.broadwayplaypub.com/catalog/plays/newly-acquired/"))
        puts ""
        puts "Here are Broadway Play Publishing, Inc.'s featured plays:"
        super
    end

    def self.play_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.bpp_info(self.all[index].url))
        super
    end

end
