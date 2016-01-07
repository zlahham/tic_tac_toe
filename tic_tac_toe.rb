def grid_shape
  board_layout = Array.new(3, ".").map{|row| Array.new(3, ".")}
  row_label = ["0", "1", "2"]
  column_label = ["A", "B", "C"]
  print "\t"
  print row_label.join("\t")
  puts
  board_layout.each_with_index do |row, i|
    print column_label[i]
    print "\t"
    print row.join("\t")
    puts
  end

  puts "\nIt is now your turn!\n"
end

p grid_shape
