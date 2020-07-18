class PRLS::CLI::BPP < PRLS::CLI::PRO

    def self.get_plays
        if self.all.empty?
            url = "https://www.broadwayplaypub.com/catalog/plays/newly-published/?paged=&count=90"
            self.new_from_scrape(PRLS::CLI::Scraper.new.bpp_index(url))
        end
    end

    def self.list_plays
        puts ""
        puts "Here are Broadway Play Publishing, Inc.'s featured plays:"
        super
    end

    def self.get_details(index)
        if self.all[index].need_attr?
            self.all[index].add_attr_array(PRLS::CLI::Scraper.new.bpp_info(self.all[index].url))
        end
    end

end
