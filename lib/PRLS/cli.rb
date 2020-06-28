class PRLS::CLI

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
        puts "2. Concord Theatricals (formerly Samuel French, Ltd.) ****TO BE ADDED****"
        puts "3. Music Theatre International"
        puts "4. Playscripts, Inc. ****TO BE ADDED****"
        puts "5. Broadway Play Publishing, Inc."
        puts ""
        puts "To exit, type 'exit'."
        puts ""
        #counter = 1
        #pro_arr.each do |pro|
        #    puts "#{counter}. #{pro}"
        #    counter += 1
        #end
    end

    def menu
        input = nil
        while input != 'exit'
        pros
        input = gets.chomp.downcase
        puts ""
        puts "Loading..."
        puts ""
        case input.to_s
        when '1'
            DPS.get_plays
            DPS.list_plays
        when '2'
            CONCORD.get_plays
            CONCORD.list_plays
        when '3'
            MTI.get_plays
            MTI.list_plays
        when '4'
            PLAYSCRIPTS.get_plays
            PLAYSCRIPTS.list_plays
        when '5'
            BPP.get_plays
            BPP.list_plays
        when 'exit'
            puts 'Exiting...'
        else
            puts 'Invalid entry. Please try again.'
            puts ""
            menu
        end
        end
    end

end