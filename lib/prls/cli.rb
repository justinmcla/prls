class PRLS::CLI

    SESSION = []

    def initialize
        SESSION << self
    end

    def self.session 
        SESSION.first
    end

    def call
        header
        menu
    end

    def header
        puts ""
        puts "PERFORMING RIGHTS LOOKUP SERVICE"
        puts "--------------------------------"
    end

    def pros
        puts ""
        puts "Select a PRO to see their currently featured plays:"
        puts ""
        puts "1. Dramatist's Play Service, Inc."
        puts "2. Concord Theatricals (formerly Samuel French, Ltd.)"
        puts "3. Music Theatre International"
        puts "4. Playscripts, Inc."
        puts "5. Broadway Play Publishing, Inc."
        puts ""
        puts "To exit, type 'exit'."
        puts ""
    end

    def menu
        input = nil
        while input != 'exit'
        pros
        input = gets.chomp.downcase
        case input.to_s
        when '1'
            puts ""
            puts "Loading..."
            puts ""
            DPS.get_plays
            DPS.list_plays
        when '2'
            puts ""
            puts "Loading..."
            puts ""
            CONCORD.get_plays
            CONCORD.list_plays
        when '3'
            puts ""
            puts "Loading..."
            puts ""
            MTI.get_plays
            MTI.list_plays
        when '4'
            puts ""
            puts "Loading..."
            puts ""
            PLAYSCRIPTS.get_plays
            PLAYSCRIPTS.list_plays
        when '5'
            puts ""
            puts "Loading..."
            puts ""
            BPP.get_plays
            BPP.list_plays
        when 'exit'
            puts 'Exiting...'
            exit
        else
            puts 'Invalid entry. Please try again.'
            puts ""
            menu
        end
        end
    end

end
