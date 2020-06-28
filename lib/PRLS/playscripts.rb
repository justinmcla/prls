class PRLS::CLI::PLAYSCRIPTS < PRLS::CLI::PRO
    
    PLAYSCRIPTS_PLAYS = []

    def initialize(attributes)
        super
        PLAYSCRIPTS_PLAYS << self
    end

    def self.all
        PLAYSCRIPTS_PLAYS
    end

    def self.get_plays
        url = "https://www.playscripts.com/find-a-play?sort=recentpopularity"
        self.new_from_scrape(PRLS::CLI::Scraper.new.playscripts_index(url))
    end

    def self.list_plays
        puts ""
        puts "Loading..."
        puts ""
        puts "Here are Playscripts, Inc.'s featured plays:"
        super
    end

    def self.get_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.playscripts_info(self.all[index].url))
    end

end