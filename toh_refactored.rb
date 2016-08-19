class TowersOfHanoi

@tower_height = 0
@player_move = []
@min_turns = 0
@current_turn = 0
@col_a = []
@col_b = []
@col_c = []
@game_board = []
@game_over = false
@syntax_error_free = false
@stack_error_free = false
@active_cols = { '1' => [], '2' => [], '3' => [] }


  def start_game

    puts "############################################################"
    puts "#                                                          #"
    puts "#\tWelcome to Towers of Hanoi!!                       #"
    puts "#                                                          #"
    puts "#\tInstructions:                                      #"
    puts "#\tEnter where you'd like to move from and to         #"
    puts "#\tin the format '1,3'.  Enter 'q' to quit.           #"
    puts "#                                                          #"
    puts "############################################################"
    puts "\n\tHow tall will your tower be?\n>> "
    @tower_height = gets.chomp

    return @tower_height.to_i
  end

#----------

  def init_col_a(tower_height)
    col_a = []

    for i in 1..tower_height do
      col_a[i-1] = "o" * i
    end

    col_a.push("1")
    col_a
  end

#---------

  def init_empty_cols(tower_height)
    cols = []

    for i in 1..tower_height do
      cols[i-1] = " "
    end
    cols
  end

#----------

  def display_game_board(active_cols, tower_height)

    col_a = active_cols[1]
    col_b = active_cols[2]
    col_c = active_cols[3]


    for i in 0..tower_height do
      puts "\t#{col_a[i]}\t#{col_b[i]}\t#{col_c[i]}"
    end

  end

#-----------

  def get_player_move

    print "Make your move! \n>>"
    player_move = gets.chomp
    player_move = player_move.split(",")
    player_move

  end

#----------

  def remove_from_col(col)

    i = col.count(' ')
    col[i] = ' '

    col

  end

#------------

  def add_to_col(from_col, to_col)

    from_index = from_col.count(' ')
    to_index = to_col.count(' ') - 1

    to_col[to_index] = from_col[from_index]

    to_col
  end

#-------------

  def check_for_win(col_a, col_b, col_c, tower_height, min_turns, current_turn)

    winning_board = init_col_a(tower_height)

    if col_c[0] == winning_board[0]
      puts "You win the game!"
      puts "It took you #{current_turn} turns.  The minumum was #{min_turns}."
      return true
    else
      return false
    end

  end

#-------------

  def valid_syntax?(active_cols, tower_height, player_move)

    if player_move[0] == "q"
      error_free = true
      return error_free
    end

    a = player_move[0]

    from_col = active_cols[a.to_i]

    return false if (player_move[1].to_i > 3) || (player_move[0].to_i > 3) || (player_move[0].to_i < 1)

    if from_col[tower_height-1] != ' ' && from_col[tower_height] != a.to_i
      error_free = true
    else
      error_free = false
    end

    error_free
  end

#----------------------------

  def update_cols(col_a, col_b, col_c)

    active_cols = Hash.new
    active_cols[1] = col_a
    active_cols[2] = col_b
    active_cols[3] = col_c
    active_cols

  end

#----------------------

  def valid_move?(active_cols, tower_height, player_move)

    if player_move[0] == "q"
      error_free = true
      return error_free
    end

    a = player_move[0].to_i
    b = player_move[1].to_i

    if (player_move[0].to_i < 1 || player_move[0].to_i > 3) || (player_move[1].to_i < 1 || player_move[1].to_i > 3)
      puts "Valid moves only 1-3, ex. '1,3'"
      return false
    end

    from_col = active_cols[a]
    to_col = active_cols[b]

    if from_col[from_col.count(' ')] > to_col[to_col.count(' ')]
      error_free = false
    else
      error_free = true
    end

    error_free = true if to_col[tower_height - 1] == " "

    error_free
  end

#----------------

  def update_game(active_cols, player_move)

    f = player_move[0].to_i
    t = player_move[1].to_i

    from = active_cols[f]
    to = active_cols[t]

    active_cols[t] = add_to_col(from, to)
    active_cols[f] = remove_from_col(from)

    return active_cols

  end

#----------------
  def game_loop
    @current_turn = 0
    @tower_height = start_game
    @min_turns = 2**@tower_height - 1
    puts "\nThe minimum number of turns to win with a tower #{@tower_height} units tall is: #{@min_turns}."
    puts "Think you can do it?"
    @col_a = init_col_a(@tower_height)
    @col_b = init_empty_cols(@tower_height)
    @col_b.push("2")
    @col_c = init_empty_cols(@tower_height)
    @col_c.push("3")
    @active_cols = update_cols(@col_a, @col_b, @col_c)
    display_game_board(@active_cols, @tower_height)

    until @game_over
      @player_move = []
      @current_turn += 1
      @player_move = get_player_move


      @syntax_error_free = valid_syntax?(@active_cols, @tower_height, @player_move)
      @stack_error_free = valid_move?(@active_cols, @tower_height, @player_move)

      until @syntax_error_free && @stack_error_free
        @player_move = get_player_move
        @syntax_error_free = valid_syntax?(@active_cols, @tower_height, @player_move)
        @stack_error_free = valid_move?(@active_cols, @tower_height, @player_move)
        puts "You may not move a larger stack onto a smaller stack."
      end

      exit if @player_move[0] == "q"

      @active_cols = update_game(@active_cols, @player_move)
      display_game_board(@active_cols, @tower_height)

      @game_over = check_for_win(@col_a, @col_b, @col_c, @tower_height, @min_turns, @current_turn) if @current_turn >= @min_turns
    end
  end

end


game = TowersOfHanoi.new
game.game_loop
