correct = "윤년입니다."
incorrect = "윤년이 아닙니다."

puts "윤년 판별기 가동합니다. 우우우우웅"

while true
    puts "연도를 입력하세요: "
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
    puts "더 하시겠습니까?: [y/n]"
    answer = gets.chomp
    if answer == 'n'
        puts "윤년 판별기 종료합니다. 쉬이이이익."
        break
    end
end
