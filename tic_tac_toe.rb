class Player
    attr_reader :name, :symbol
    
    def initialize name, symbol
        @name = name
        @symbol = symbol
    end
    
    def turn
        puts "#{@name}'s turn (#{@symbol}):"
        input = gets.chomp
    end
end

class GameBoard < Player
    attr_accessor :board, :victory, :board_positions, :one

    def initialize 
        @one = "1"
        @two = "2"
        @three = "3"
        @four = "4"
        @five = "5"
        @six = "6"
        @seven = "7"
        @eight = "8"
        @nine = "9"

        @victory = false
    end

    

    @board_positions = [@one, @two, @three, @four, @five, @six, @seven, @eight, @nine]

    @@winning_rows = [
        [@one, @two, @three],
        [@four, @five, @six],
        [@seven, @eight, @nine],
        [@one, @four, @seven],
        [@two, @five, @eight],
        [@three, @six, @nine],
        [@one, @five, @nine],
        [@three, @five, @seven]
    ]

    @@winnner = nil

    def board_view
        puts ""
        puts " #{@one} | #{@two} | #{@three} ".center(100)
        puts "---|---|---".center(100)
        puts " #{@four} | #{@five} | #{@six} ".center(100)
        puts "---|---|---".center(100)
        puts " #{@seven} | #{@eight} | #{@nine} ".center(100)
    end

    def check_victory 
        @@winning_rows.each do |row|
            if row.all? {|i| i === "X"} || row.all? {|i| i === "O"}
                @victory = true
            end
        end
    end
end

puts "------------------------------------------------------------------".center(100)
puts ""
puts "WELCOME TO TIC-TAC-TOE".center(100)
puts ""
puts "------------------------------------------------------------------".center(100)

replay = "yes"
while replay == "yes"
    puts "\nEnter Player 1's Name (X):"
    player_1_name = gets.chomp.strip
    player_1 = Player.new player_1_name, "X"

    puts "\nEnter Player 2's Name (O):"
    player_2_name = gets.chomp.strip
    player_2 = Player.new player_2_name, "O"

    # puts "---------------------------".center(100)
    # puts ""
    # puts "READY TO PLAY? (yes/no)".center(100)
    # puts ""
    # puts "---------------------------".center(100)

    # ready = gets.chomp.downcase
    # until ready == "yes"
    #     ["\n\t\t\t\t\t\t.", ".", "."].each {|i| print i; sleep 1}
    #     2.times {puts ""}
    #     puts "-----------------------------------".center(100)
    #     puts ""
    #     puts "... ARE YOU READY NOW? (yes/no)".center(100)
    #     puts ""
    #     puts "-----------------------------------".center(100)
    #     ready = gets.chomp.downcase
    # end

    new_game = GameBoard.new
    puts new_game.board_view

    while new_game.victory == false
        player_1.turn
        new_game.one = player_1.symbol
        puts new_game.board_view
        new_game.check_victory

        break if new_game.victory

        player_2.turn
        puts new_game.board_view
        new_game.check_victory
    end

    puts "Congratulations, whoever won."
    puts "Replay? (yes/no)"
    replay = gets.chomp.downcase
end
puts "-----------------------------------".center(100)
puts ""
puts "THANKS FOR PLAYING".center(100)
puts ""
puts "-----------------------------------".center(100)

