class TowersOfHanoi

@tower_height = 0
@tower_pieces = Array.new
@player_move = Array.new

  def init_game_board(tower_pieces)
    @tower_pieces = tower_pieces

    @tower_pieces.each_index do |ind|
      (1+ind).times { print "o" }
      puts ""
    end

    3.times do
      @tower_pieces.length.times {print "-"}
      print "\t"
    end

    puts ""
  end


  def start_game
    tower_pieces = []
    puts "Welcome to Towers of Hanoi!!\n"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'.  Enter 'q' to quit."
    print "How tall will your tower be?\n>> "
    @tower_height= gets.chomp

    for i in 0...@tower_height.to_i
      tower_pieces.push(i)
    end

    return tower_pieces
  end


  def get_player_move

    print "Make your move! \n>>"
    player_move = gets.chomp.split(",")

  end

  def update_game_board(tower_pieces, player_move)

    col_a = []
    col_b = []
    col_c = []



  end


  def game_loop

    @tower_pieces = start_game
    init_game_board(@tower_pieces)
    @player_move = get_player_move
    exit if @player_move[0] == "q"
    update_game_board(@tower_pieces, @player_move)

  end

end


game = TowersOfHanoi.new
game.game_loop
