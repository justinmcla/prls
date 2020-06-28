class PRLS::CLI::BPP < PRLS::CLI::PRO
    
    BPP_PLAYS = []

    def initialize(attributes)
        super
        BPP_PLAYS << self
    end

    def self.all
        BPP_PLAYS
    end

    def self.get_plays
        url = "https://www.broadwayplaypub.com/catalog/plays/newly-published/?paged=&count=90"
        self.new_from_scrape(PRLS::CLI::Scraper.new.bpp_index(url))
    end

    def self.list_plays
        puts ""
        puts "Loading..."
        puts ""
        puts "Here are Broadway Play Publishing, Inc.'s featured plays:"
        super
    end

    def self.get_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.bpp_info(self.all[index].url))
    end

end
