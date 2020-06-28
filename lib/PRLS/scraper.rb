class PRLS::CLI::Scraper

    attr_accessor :dps_plays, :dps_content,
                    :mti_plays, :mti_content,
                    :concord_plays, :concord_content,
                    :playscripts_plays, :playscripts_content,
                    :bpp_plays, :bpp_content


    def dps_index(url)
        dps_index = Nokogiri::HTML(open(url))
        @dps_plays = []

        dps_index.css('table td a').each do |play|
            if play != nil
            @dps_plays << {
                :title => play.text,
                :url => play.attribute('href').value
            }
            end
        end
        @dps_plays
    end

    def dps_info(url)
        dps_info = Nokogiri::HTML(open(url))
        @dps_content = {}

        dps_info.css('#single').each do |content|
            @dps_content = {
                :author => content.css('#authorname').text,
                :summary => content.css('#lexisynopsis').text,
                :blurb => content.css('.lexishorttext').text
            }
        end
        @dps_content
    end

    def concord_index(url)
        concord_index = Nokogiri::HTML(open(url))
        @concord_plays = []
        concord_index.css('.card__item--text').each do |play|
            @concord_plays << {
                :title => play.css('a').text,
                :url => "https://www.concordtheatricals.com#{play.css('a').attribute('href').value}"
            }
        end
        @concord_plays
    end

    def concord_info(url)
        concord_info = Nokogiri::HTML(open(url))
        @concord_content = {
            :author => concord_info.css('.type-large-credits').css('a').first.text,
            :summary => concord_info.css('.pdp-section .type-regular').css('.longer-content').text,
            :blurb => []
        }
        concord_info.css('type-regular').css('.pdp-sub-section').each do |review|
            @concord_content[:blurb] << review.text
        end
        @concord_content[:blurb] = @concord_content[:blurb].join(' ')
        @concord_content
    end

    def mti_index(url)
        mti_index = Nokogiri::HTML(open(url))
        @mti_plays = []

        mti_index.css('.alphabetical-item').each do |play|
            @mti_plays << {
                :title => play.css('span').text,
                :url => play.css('a').attribute('href').value
            }
        end
        @mti_plays
    end

    def mti_info(url)
        mti_data = Nokogiri::HTML(open(url))
        @mti_content = {}

          mti_data.css('.group-content-main').each do |content|
            @mti_content = {
                :author => [],
                :summary => content.css('.show__summary').text,
                :blurb => content.css('.show__brief').text
            }
        end

        mti_data.css('.show__attributions .attribution__author-name').each do |author|
            @mti_content[:author] << author.text
        end

        @mti_content[:author] = @mti_content[:author].uniq.join(', ')

        @mti_content
    end

    def bpp_index(url)
        bpp_index = Nokogiri::HTML(open(url))
        @bpp_plays = []
        bpp_index.css('.product-details').each do |play|
            @bpp_plays << {
                :title => play.css('a').text.chomp(' [read more]'),
                :url => play.css('a').attribute('href').value
            }
        end
        @bpp_plays
    end

    def bpp_info(url)
        bpp_data = Nokogiri::HTML(open(url))
        play = bpp_data.css('.product-essential')
        @bpp_content = {:author => play.css('.authorbilling').text, :blurb => []}
        if play.css('.description p').first != nil
            @bpp_content[:summary] = play.css('.description p').first.text
        end
        play.css('#tab-reviews p').each do |review|
            if review != nil
            @bpp_content[:blurb] << review.text
            end
        end
        @bpp_content[:blurb] = @bpp_content[:blurb].join(' ')
        @bpp_content
    end

end


