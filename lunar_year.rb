correct = "윤년입니다."
incorrect = "윤년이 아닙니다."

year = gets.chomp.to_i
if year % 400 == 0
    puts correct
elsif year % 100 == 0
    puts incorrect
elsif year % 4 == 0
    puts correct
else
    puts incorrect
end
