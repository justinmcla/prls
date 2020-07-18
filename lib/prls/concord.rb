class PRLS::CLI::CONCORD < PRLS::CLI::PRO

    CONCORD_PLAYS = []

    def self.all
        CONCORD_PLAYS
    end
    
    def self.get_plays
        if self.all.empty?
            super
            url = "https://www.concordtheatricals.com/perform/plays"
            self.new_from_scrape(PRLS::CLI::Scraper.new.concord_index(url))
        end
    end

    def self.list_plays
        puts ""
        puts "Here are Concord Theatrical's featured plays:"
        super
    end

    def self.get_details(index)
        if self.all[index].need_attr?
            self.all[index].add_attr_array(PRLS::CLI::Scraper.new.concord_info(self.all[index].url))
        end
    end

end
