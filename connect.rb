class Grid
    attr_accessor :h0, :h1, :h2, :h3, :h4, :h5, :h6, :grid



    def initialize
        circ = "\u25cc"
        empty_circle = circ.encode('utf-8') + "  "
    
        @h0 = [" ", empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle]
        @h1 = [" ", empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle]
        @h2 = [" ", empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle]
        @h3 = [" ", empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle]
        @h4 = [" ", empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle]
        @h5 = [" ", empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle, empty_circle]
        @h6 = [" ","1  ", "2  ", "3  ", "4  ", "5  ", "6  ", "7  "]
        @grid = [@h0, @h1, @h2, @h3, @h4, @h5, @h6]
    end

    def draw
        vert_ind = 0
        while vert_ind < 7
            row = grid[vert_ind].join('')
            puts row
            vert_ind += 1
        end
    end

    def update(vert, horiz, current)
            grid[vert][horiz] = "#{current} "
    end
end

class Current
    attr_accessor :i_am
    def initialize
        @i_am = "nothing yet"
    end
    def what_am_i?(counter)
        if (counter % 2 == 0)
            white = "\u25cb"
            white_circle = white.encode('utf-8') + " "
            @i_am = white_circle
        else
            black = "\u25cf"
            black_circle = black.encode('utf-8') + " "
            @i_am = black_circle
        end
        i_am
    end
end

class WinnerCheck
    attr_accessor :marker, :mesh
    def initialize(marker, mesh)
        @marker = marker
        @mesh = mesh
    end
    def won(passedVal)
        #if ((mesh[1][1] == passedVal) && (mesh[1][2] == passedVal) && (mesh[1][3] == passedVal))
        #    return true
        #elsif ((mesh[2][1] == passedVal) && (mesh[2][2] == passedVal) && (mesh[2][3] == passedVal))
        #    return true
        #elsif ((mesh[3][1] == passedVal) && (mesh[3][2] == passedVal) && (mesh[3][3] == passedVal))
        #    return true
        #elsif ((mesh[1][1] == passedVal) && (mesh[2][1] == passedVal) && (mesh[3][1] == passedVal))
        #    return true
        #elsif ((mesh[1][2] == passedVal) && (mesh[2][2] == passedVal) && (mesh[3][2] == passedVal))
        #    return true
        #elsif ((mesh[1][3] == passedVal) && (mesh[2][3] == passedVal) && (mesh[3][3] == passedVal))
        #    return true
        #elsif ((mesh[1][3] == passedVal) && (mesh[2][2] == passedVal) && (mesh[3][1] == passedVal))
        #    return true
        #elsif ((mesh[1][1] == passedVal) && (mesh[2][2] == passedVal) && (mesh[3][3] == passedVal))
        #    return true
        #else
        #    return false
        #end

        vertical_index = 0
        while vertical_index < mesh.size

            horizontal_index = 1
            while horizontal_index <= 7
                if (mesh[vertical_index][horizontal_index] != nil) && (mesh[vertical_index][horizontal_index].include? marker)
                    if (mesh[vertical_index][horizontal_index + 1] != nil) && (mesh[vertical_index][horizontal_index + 1].include? marker)
                        if (mesh[vertical_index][horizontal_index + 2] != nil) && (mesh[vertical_index][horizontal_index + 2].include? marker)
                            if (mesh[vertical_index][horizontal_index + 3] != nil) && (mesh[vertical_index][horizontal_index + 3].include? marker)
                                return true
                            end
                        end
                    elsif mesh[vertical_index + 1] != nil
                        if (mesh[vertical_index + 1][horizontal_index].include? marker)
                            if mesh[vertical_index + 2] != nil
                                if (mesh[vertical_index + 2][horizontal_index].include? marker)
                                    if mesh[vertical_index + 3] != nil
                                        if (mesh[vertical_index + 3][horizontal_index].include? marker)
                                            return true
                                        end
                                    end
                                end
                            end
                        elsif (mesh[vertical_index + 1][horizontal_index + 1] != nil) && (mesh[vertical_index + 1][horizontal_index + 1].include? marker)
                            if mesh[vertical_index + 2] != nil
                                if (mesh[vertical_index + 2][horizontal_index + 2] != nil) && (mesh[vertical_index + 2][horizontal_index + 2].include? marker)
                                    if mesh[vertical_index + 3] != nil
                                        if (mesh[vertical_index + 3][horizontal_index + 3] != nil) && (mesh[vertical_index + 3][horizontal_index + 3].include? marker)
                                            return true
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if (mesh[vertical_index][horizontal_index] != nil) && (mesh[vertical_index][horizontal_index].include? marker)
                    if mesh[vertical_index + 1] != nil
                        if (mesh[vertical_index + 1][horizontal_index - 1] != nil) && (mesh[vertical_index + 1][horizontal_index - 1].include? marker)
                            if mesh[vertical_index + 2] != nil
                                if (mesh[vertical_index + 2][horizontal_index - 2] != nil) && (mesh[vertical_index + 2][horizontal_index - 2].include? marker)
                                    if mesh[vertical_index + 3] != nil
                                        if (mesh[vertical_index + 3][horizontal_index - 3] != nil) && (mesh[vertical_index + 3][horizontal_index - 3].include? marker)
                                            return true
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                
                horizontal_index += 1
            end

            vertical_index += 1
        end


    end
    puts ""
end

puts ""
puts "Let's Play Connect Four!"
puts ""
my_grid = Grid.new
my_counter = 0
my_grid.draw
puts ""
player = Current.new

while my_counter < 42
    current_player = player.what_am_i?(my_counter)
    occupied = true
    puts "**************************************"
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    puts ""
    puts "It is player #{current_player}'s turn!"
    puts ""
    
    while (occupied)
        puts "What column between 1 and 7 would you like to place your piece?"
        horizontal = gets.chomp
        while (!(1..7).include? horizontal.to_i)
            puts ""
            puts "Invalid input, try entering your column again!"
            horizontal = gets.chomp
        end
        
        circ = "\u25cc"
        empty_circle = circ.encode('utf-8') + "  "
        bottom_to_top = 6

        while (bottom_to_top >= 0)
            candidate = my_grid.grid[bottom_to_top.to_i][horizontal.to_i]
            if candidate == empty_circle
                my_grid.update(bottom_to_top.to_i, horizontal.to_i, current_player)
                puts ""
                occupied = false
            end
            break if !occupied
            bottom_to_top -= 1
        end
        break if !occupied
        puts ""
        puts "That column is already full!  Try picking an available column this time:"
        puts ""
    end
    
    
    puts ""
    puts "Here is the updated grid: "
    puts ""
    
    my_grid.draw
    status = WinnerCheck.new(current_player, my_grid.grid)
    tar = "#{current_player} "
    puts ""
    did_win = status.won(tar)

    if did_win == true
        puts ""
        puts "**************************************"
        puts " Congratulations player #{current_player}, you won!!!"
        puts "**************************************"
        puts ""
        break
    end
    my_counter += 1
end

if did_win == false
    puts ""
    puts "**************************************"
    puts " It's a draw, no winner, no loser."
    puts "**************************************"
    puts ""
end
