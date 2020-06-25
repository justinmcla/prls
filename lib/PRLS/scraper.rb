require 'nokogiri'
require 'open-uri'


class PRLS::CLI::Scraper

    attr_accessor :dps_data, :dps_plays, :dps_content,
                    :mti_data, :mti_plays, :mti_content,
                    :concord_data, :concord_plays, :concord_content,
                    :playscripts_data, :playscripts_plays, :playscripts_content,
                    :bpp_data, :bpp_plays, :bpp_content


    def dps_index(url)
        dps_index = Nokogiri::HTML(open(url))
         #@dps_data = []
        @dps_plays = []

        dps_index.css('table td a').each do |play|
            if play != nil
            @dps_plays << {
                :title => play.text,
                :url => play.attribute('href').value
            }
            end
        end
        #@dps_data << dps_index.css('.responsadjust-fcol p').text
        @dps_plays
    end

    def dps_info(url)
        dps_info = Nokogiri::HTML(open(url))
        @dps_content = {}

        dps_info.css('#single').each do |content|
            @dps_content = {
                :title => content.css('#maxtitleheight').text,
                :author => content.css('#authorname').text,
                :summary => content.css('#lexisynopsis').text,
                :blurb => content.css('.lexishorttext').text
            }
        end
        @dps_content
    end

    def mti_index(url)
        mti_index = Nokogiri::HTML(open(url))
        #@mti_data = []
        @mti_plays = []

        mti_index.css('.alphabetical-item').each do |play|
            @mti_plays << {
                :title => play.css('span').text,
                :url => play.css('a').attribute('href').value
            }
        end

        #mti_index.css('.footer-address.footer-address-us.first').each do |play|
        #    @mti_data << {
        #        :name => play.css('.footer-address__title').text,
        #        :street_1 => play.css('.footer-address__street').text,
        #        :city_state_zip => play.css('.footer-address__city-state-zip').text,
        #        :phone => play.css('.footer-address__phone-number').text
        #    }
        #end

        @mti_plays
    end

    def mti_info(url)
        mti_data = Nokogiri::HTML(open(url))
        @mti_content = {}

          mti_data.css('.group-content-main').each do |content|
            @mti_content = {
                :name => content.css('.page-title').text,
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

end


