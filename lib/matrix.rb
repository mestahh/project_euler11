class Matrix
  
  def initialize 
    @matrix = []
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