class TowersOfHanoi

@tower_height = 0
#@tower_pieces = []
@player_move = []
@min_turns = 0
@current_turn = 0
@col_a = []
@col_b = []
@col_c = []
@game_board = []



  def start_game

    puts "Welcome to Towers of Hanoi!!\n"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'.  Enter 'q' to quit."
    print "How tall will your tower be?\n>> "
    @tower_height = gets.chomp

    return @tower_height.to_i
  end

#----------

  def init_col_a(tower_height)
    col_a = []

    for i in 1..tower_height do
      col_a[i-1] = "o" * i
    end

    col_a.push("-" * tower_height)

  end

#---------

  def init_empty_cols(tower_height)
    cols = []

    for i in 1..tower_height do
      cols[i-1] = " " * i
    end

    cols.push("-" * tower_height)

  end

#----------

  def display_game_board(col_a, col_b, col_c, tower_height)

    for i in 0..tower_height do
      puts "\t#{col_a[i]}\t#{col_b[i]}\t#{col_c[i]}"
    end

  end

#-----------

  def get_player_move

    print "Make your move! \n>>"
    player_move = gets.chomp.split(",")

  end

#----------

  def update_game_board(col_a, col_b, col_c, player_move)

    



  end


  def game_loop

    @tower_height = start_game
    @col_a = init_col_a(@tower_height)
    @col_b = init_empty_cols(@tower_height)
    @col_c = init_empty_cols(@tower_height)
    display_game_board(@col_a, @col_b, @col_c, @tower_height)
    @player_move = get_player_move
    exit if @player_move[0] == "q"
    @game_board = update_game_board(@col_a, @col_b, @col_c, @player_move)
    #check_for_win if @current_turn >= @min_turns

  end

end


game = TowersOfHanoi.new
game.game_loop
