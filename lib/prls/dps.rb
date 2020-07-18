class PRLS::CLI::DPS < PRLS::CLI::PRO

    def self.get_plays
        if self.all.empty?
            url = "https://www.dramatists.com/dps/nowpublished.aspx"
            self.new_from_scrape(PRLS::CLI::Scraper.new.dps_index(url))
        end
    end

    def self.list_plays
        puts ""
        puts "Here are Dramatist's Play Service, Inc.'s featured plays:"
        super
    end

    def self.get_details(index)
        if self.all[index].need_attr?
            self.all[index].add_attr_array(PRLS::CLI::Scraper.new.dps_info(self.all[index].url))
        end
    end
end
