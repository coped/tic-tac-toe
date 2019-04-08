class Player 
    attr_reader :symbol
    def initialize name, symbol
        @name = name
        @symbol = symbol
    end
    
    public

    def turn
        puts "#{@name}'s turn (#{@symbol}):"
        input = gets.chomp.to_i
        until (1..9).include? input
            puts "\nEnter a valid number."
            input = gets.chomp.to_i
        end
        input
    end
end

class GameBoard
    attr_reader :end

    def initialize  position
        @position = position
        @end = false
        self.board_view
    end

    public
    
    def fill_position input, symbol
        @position[input] = symbol
        self.board_view
        self.check_end
    end
    
    protected

    def board_view
        puts ""
        puts " #{@position[1]} | #{@position[2]} | #{@position[3]} ".center(100)
        puts "---|---|---".center(100)
        puts " #{@position[4]} | #{@position[5]} | #{@position[6]} ".center(100)
        puts "---|---|---".center(100)
        puts " #{@position[7]} | #{@position[8]} | #{@position[9]} ".center(100)
        puts ""
    end
    
    @@winning_rows = [
        [1, 2, 3], [4, 5, 6],
        [7, 8, 9], [1, 4, 7],
        [2, 5, 8], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]
    ]

    def check_end 
        @@winning_rows.each do |row|
            if row.all? {|i| @position[i] === "X"}
                @end = true
                puts "-----------------------------------".center(100)
                puts ""
                puts "PLAYER 1 WINS!".center(100)
                puts ""
                puts "-----------------------------------".center(100)
            elsif row.all? {|i| @position[i] === "O"}
                @end = true
                puts "-----------------------------------".center(100)
                puts ""
                puts "PLAYER 2 WINS!".center(100)
                puts ""
                puts "-----------------------------------".center(100)
            end
        end

        if @position[1..9].any? {|i| i.is_a? Integer}
            nil
        else
            @end = true
            puts "-----------------------------------".center(100)
            puts ""
            puts "DRAW!".center(100)
            puts ""
            puts "-----------------------------------".center(100)
        end
    end
end

puts "------------------------------------------------------------------".center(100)
puts ""
puts "WELCOME TO TIC-TAC-TOE".center(100)
puts ""
puts "------------------------------------------------------------------".center(100)

puts "\nEnter Player 1's Name (X):"
player_1 = Player.new gets.chomp.strip, "X"

puts "\nEnter Player 2's Name (O):"
player_2 = Player.new gets.chomp.strip, "O"

puts "---------------------------".center(100)
puts ""
puts "READY TO PLAY? (yes/no)".center(100)
puts ""
puts "---------------------------".center(100)

ready = gets.chomp.downcase
until ready == "yes"
    ["\n\t\t\t\t\t\t.", ".", "."].each {|i| print i; sleep 1}
    2.times {puts ""}
    puts "-----------------------------------".center(100)
    puts ""
    puts "... ARE YOU READY NOW? (yes/no)".center(100)
    puts ""
    puts "-----------------------------------".center(100)
    ready = gets.chomp.downcase
end

replay = "yes"
while replay == "yes"
    puts "-------------------------".center(100)
    puts ""
    puts "LET'S BEGIN".center(100)
    puts ""
    puts "-------------------------".center(100)
    game = GameBoard.new([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

    while game.end == false
        game.fill_position player_1.turn, player_1.symbol

        break if game.end

        game.fill_position player_2.turn, player_2.symbol
    end

    puts "\nReplay? (yes/no)"
    replay = gets.chomp.downcase
end
puts "------------------------------".center(100)
puts ""
puts "THANKS FOR PLAYING".center(100)
puts ""
puts "------------------------------".center(100)

