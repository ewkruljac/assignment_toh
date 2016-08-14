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
@game_over = false


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

    col_a.push"1"
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

  def remove_from_col(col)

    col.each_index do |ind|
      if col[ind] != " "
        puts "in the if"
        col[ind] = " "
      end
      break
    end

    return col
  end

#------------

  def add_to_col(col_1, col_2)
    temp_i = 0
    for i in 0...col_1.length do
      while (col_1[i] == " " && col_1[i] != "1" && col_1[i] != "2" && col_1[i] != "3" && col_1[i] != "o")
        temp_i = i
        break
    end
    end

    for j in 0...col_2.length do
      if (col_2[j] != " " && col_1[i] != "1" && col_1[i] != "2" && col_1[i] != "3")
        col_2_temp = col_2[j]
      end
      break
    end

    col_1[temp_i] = col_2[j]

    return col_1
  end

#-------------


#-------------

  def display_updated_game_board(col_a, col_b, col_c, player_move)

    move_1 = player_move[0]
    move_2 = player_move[1]



  end

#----------

  def game_loop
    @tower_height = start_game
    @min_turns = 2**@tower_height - 1
    @col_a = init_col_a(@tower_height)
    @col_b = init_empty_cols(@tower_height)
    @col_b.push("2")
    @col_c = init_empty_cols(@tower_height)
    @col_c.push("3")
    display_game_board(@col_a, @col_b, @col_c, @tower_height)

    until @game_over
      @player_move = []
      puts "player_move: #{@player_move}"
      @player_move = get_player_move
      puts "player_move: #{@player_move}"
      exit if @player_move[0] == "q"

      case @player_move
      when ["1", "2"]
        @col_b = add_to_col(@col_b, @col_a)
        @col_a = remove_from_col(@col_a)
        puts "In the case: col_a: #{@col_a}"
        puts "In the case: col_b: #{@col_b}, col_a: #{@col_a}"
      when ["1", "3"]
        @col_c = add_to_col(@col_c, @col_a)
        @col_a = remove_from_col(@col_a)
        puts "In the case: col_a: #{@col_a}"
        puts "In the case: col_c: #{@col_c}, col_a: #{@col_a}"
      when ["2", "3"]
        @col_c = add_to_col(@col_c, @col_b)
        @col_b = remove_from_col(@col_b)
        puts "In the case: col_b: #{@col_b}"
        puts "In the case: col_c: #{@col_c}, col_b: #{@col_b}"
      when ["2", "1"]
        @col_a = add_to_col(@col_1, @col_b)
        @col_b = remove_from_col(@col_b)
      when ["3", "1"]
        @col_a = add_to_col(@col_c, @col_a)
        @col_c = remove_from_col(@col_c)
      when ["3,", "2"]
        @col_b = add_to_col(@col_c, @col_b)
        @col_c = remove_from_col(@col_b)
      end

      display_game_board(@col_a, @col_b, @col_c, @tower_height)
    #check_for_win if @current_turn >= @min_turns
    #@game_board = update_game_board(@col_a, @col_b, @col_c, @player_move)
    #check_for_win if @current_turn >= @min_turns
    end
  end

end


game = TowersOfHanoi.new
game.game_loop
