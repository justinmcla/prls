class PRLS::CLI::Scraper

    def dps_index(url)
        dps_index = Nokogiri::HTML(open(url))
        dps_index.css('table td a').map { |play| {:title => play.text, :url => play.attribute('href').value} } 
    end

    def dps_info(url)
        dps_info = Nokogiri::HTML(open(url))
        content = dps_info.css('#single')
        dps_info = [content.css('#authorname').text, content.css('#lexisynopsis').text, content.css('.lexishorttext').text]
    end

    def concord_index(url)
        concord_index = Nokogiri::HTML(open(url))
        concord_index.css('.card__item--text').map { |play| {:title => play.css('a').text, :url => "https://www.concordtheatricals.com#{play.css('a').attribute('href').value}"} }
    end

    def concord_info(url)
        concord_info = Nokogiri::HTML(open(url))
        blurbs = concord_info.css('type-regular').css('.pdp-sub-section').map { |review| review.text }
        [concord_info.css('.type-large-credits').css('a').text, concord_info.css('.pdp-section .type-regular').css('.longer-content').text, blurbs.join(' ')]
    end

    def mti_index(url)
        mti_index = Nokogiri::HTML(open(url))
        mti_index.css('.alphabetical-item').map { |play| {:title => play.css('span').text, :url => play.css('a').attribute('href').value} }
    end

    def mti_info(url)
        mti_data = Nokogiri::HTML(open(url))
        authors = mti_data.css('.show__attributions .attribution__author-name').map { |author| author.text}
        content = mti_data.css('.group-content-main')
        [authors.uniq.join(', '), content.css('.show__summary').text, content.css('.show__brief').text]
    end

    def playscripts_index(url)
        playscripts_index = Nokogiri::HTML(open(url))
        playscripts_index.css('.theater-story').map { |play| {:title => play.css('.infos').css('.text').text, :url => "https://www.playscripts.com#{play.css('.infos').css('a').attribute('href').value}"} }
    end

    def playscripts_info(url)
        playscripts_info = Nokogiri::HTML(open(url))
        blurb = []
        if playscripts_info.css('.script-more-info').css('.content').css('.p-review').first != nil
            blurb = playscripts_info.css('.script-more-info').css('.content').css('.p-review').first.text.split.join(' ')
        end
        [playscripts_info.css('.infos').css('.playauthors').css('a').text,
        playscripts_info.css('.infos').css('.story-description').text.split.join(' ').chomp(' Read More'),
        blurb]
    end

    def bpp_index(url)
        bpp_index = Nokogiri::HTML(open(url))
        bpp_index.css('.product-details').map { |play| {:title => play.css('a').text.chomp(' [read more]'), :url => play.css('a').attribute('href').value} }
    end

    def bpp_info(url)
        bpp_data = Nokogiri::HTML(open(url))
        summary = []
        if bpp_data.css('.product-essential').css('.description p').first != nil
            summary = bpp_data.css('.product-essential').css('.description p').first.text
        end
        blurb = []
        if bpp_data.css('.product-essential').css('#tab-reviews p') != nil
            blurb = bpp_data.css('.product-essential').css('#tab-reviews p').text
        end
        [bpp_data.css('.product-essential').css('.authorbilling').text, summary, blurb]
    end

end


