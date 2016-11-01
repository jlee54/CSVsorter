require 'csv'

#input handiling; command line argument or user input in console
inputCSV = ARGV[0]
outputCSV_LastName = ARGV[1]
outputCSV_FirstName = ARGV[2]
if inputCSV.nil?; puts "What is the csv file you want sort?"; inputCSV = gets.chomp!; end
if outputCSV_LastName.nil?; puts "What do you want to call the sorted by Last Name csv?"; outputCSV_LastName = gets.chomp!; end
if outputCSV_FirstName.nil?; puts "What do you want to call the sorted by First Name csv?"; outputCSV_FirstName = gets.chomp!; end


headers = CSV.open(inputCSV, &:gets)
rows = Array.new
CSV.foreach(inputCSV, :headers => true, :skip_blanks => true) do |csv_obj|
  rows << csv_obj
end

rows.sort_by!{|row| [row['Last Name'] ? 0 : 1, row['Last Name']]}
CSV.open(outputCSV_LastName, "wb") do |csv| 
  csv << headers
  rows.each {|elem| csv << elem} 
end

rows.sort_by!{ |row| [row['First Name'] ? 0 : 1, row['First Name']]}
CSV.open(outputCSV_FirstName, "wb") do |csv| 
  csv << headers
  rows.each {|elem| csv << elem} 
end
