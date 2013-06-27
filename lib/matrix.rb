class Matrix
  
  def initialize 
    @matrix = []
  end
  
  def find_max_adjacent 
    
  end
  
  def find_max_south_east_adjacent
    max = 0
    16.times do |row|
      16.times do |column| 
        result = calculate_adjacent_south_east row, column
        if result > max
          max = result
        end
      end
    end
    puts "south east " + max.to_s
  end
  
  def find_max_south_west_adjacent
    max = 0
    16.times do |row|
      5.upto(20) do |column| 
        result = calculate_adjacent_south_west row, column
        if result > max
          max = result
        end
      end
    end
    puts "south west " + max.to_s
  end
  
  def find_max_north_east_adjacent
    max = 0
    5.upto(20) do |row|
      16.times do |column| 
        result = calculate_adjacent_north_east row, column
        if result > max
          max = result
        end
      end
    end
    puts "north east " + max.to_s
  end
  
  def find_max_north_west_adjacent
    max = 0
    5.upto(20) do |row|
      5.upto(20) do |column| 
        result = calculate_adjacent_north_west row, column
        if result > max
          max = result
        end
      end
    end
    puts "north west " + max.to_s
  end
  
  def load
   File.open("matrix.txt", "r").each do |line|
    load_matrix_line(line)  
   end 
  end
  
  def get x, y
    row = @matrix[y-1]
    row[x-1]
  end

  def line_as_array line
    remove_leading_zeros(line.to_s.split ' ')
  end
  
  def calculate_adjacent_south_east(row, column)
    get(column, row) * get(column+1, row+1) * get(column+2, row+2) * get(column+3, row+3) 
  end
  
  def calculate_adjacent_north_west(row, column)
    get(column, row) * get(column-1, row-1) * get(column-2, row-2) * get(column-3, row-3) 
  end
  
  def calculate_adjacent_north_east(row, column)
    get(column, row) * get(column+1, row-1) * get(column+2, row-2) * get(column+3, row-3) 
  end
  
   def calculate_adjacent_south_west(row, column)
    get(column, row) * get(column-1, row+1) * get(column-2, row+2) * get(column-3, row+3) 
  end
  
private 
  
  def remove_leading_zeros numbers_as_string
    numbers = []
    numbers_as_string.each do |number|
     numbers << number.to_i
    end
    numbers
  end
  
  def load_matrix_line line
    @matrix << line_as_array(line)  
  end 
  
end


matrix = Matrix.new
matrix.load
matrix.find_max_south_east_adjacent
matrix.find_max_north_west_adjacent
matrix.find_max_south_west_adjacent
matrix.find_max_north_east_adjacent