class Player
    attr_reader :name

    def initialize name, symbol
        @name = name
    end

    def turn
        puts "#{@name}'s turn (#{@symbol})."
        input = gets.chomp
    end
end

class Game
    attr_accessor :board, :victory

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
        puts " #{@one} | #{@two} | #{@three} "
        puts "-----------"
        puts " #{@four} | #{@five} | #{@six} "
        puts "-----------"
        puts " #{@seven} | #{@eight} | #{@nine} "
    end

    def check_victory 
        winning_rows.each do |row|
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

replay = true
until replay == "no"
    puts "\nEnter Player 1's Name (X):"
    player_1_name = gets.chomp
    player_1 = Player.new player_1_name, "X"

    puts "\nEnter Player 2's Name (O):"
    player_2_name = gets.chomp
    player_2 = Player.new player_2_name, "O"

    puts "---------------------------".center(100)
    puts ""
    puts "READY TO PLAY? (yes/no)".center(100)
    puts ""
    puts "---------------------------".center(100)
    ready = gets.chomp.downcase
    until ready == "yes"
        puts "-----------------------------------".center(100)
        puts ""
        puts "... ARE YOU READY NOW? (yes/no)".center(100)
        puts ""
        puts "-----------------------------------".center(100)
        ready = gets.chomp.downcase
    end

    new_game = Game.new

    while new_game.victory == false
        # Main game body will go here
    end

    puts "Congratulations, whoever won."
    puts "Replay? (yes/no)"
    replay = gets.chomp.downcase
end

