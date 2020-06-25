class PRLS::CLI::DPS < PRLS::CLI::PRO

    DPS_PLAYS = []

    def initialize(attributes)
        super
        DPS_PLAYS << self
    end

    def self.all
        DPS_PLAYS
    end

    def self.list_plays
        self.reset_all
        self.new_from_scrape(PRLS::CLI::Scraper.new.dps_index("https://www.dramatists.com/dps/nowpublished.aspx"))
        puts ""
        puts "Here are Dramatist's Play Service, Inc.'s featured plays:"
        super
    end

    def self.play_details(index)
        self.all[index].add_attr(PRLS::CLI::Scraper.new.dps_info(self.all[index].url))
        super
    end
end
