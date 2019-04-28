numberrange = Array(0..9)
numbers = numberrange.sample(4)

try_count = 0

# fhand = File.new("records.txt", "a")
# fhand.puts "<<<<Strike-out Records>>>>"
# fhand.puts ""
# fhand.close

puts "<<<<야구 게임의 규칙>>>>"
puts "0부터 9까지 임의의 네 개의 숫자가 정해져있다."
puts "당신이 서로 다른 네 개의 숫자를 입력하면 그 숫자와 비교해서 알려준다."
puts "스트라이크 = 숫자와 위치가 동일"
puts "볼 = 숫자는 같지만 위치가 다름"
puts "[목표] 4S로 스트라이크 아웃을 달성하자!"
puts "게임을 시작합니다."

while true
    try_count += 1
    str_count = 0
    bal_count = 0
    guess = Array.new
    4.times do
        puts "Your guess?: "
        x = gets.chomp
        guess.push(x.to_i)
    end
    print guess
    puts ""
    for i in (0..3)
        if guess[i] == numbers[i]
            str_count += 1
        elsif numbers.include? guess[i]
            bal_count += 1
        end
    end
    if str_count == 4
        puts "스트라이크 아웃~!"
        puts "당신의 이름은?"
        name = gets.chomp
        fhand = File.new("records.txt", "a")
        fhand.puts "#{name}/#{try_count}/#{Time.now}"
        fhand.close
        puts "명예의 전당에 등록 성공!"
        print "당신의 기록: "
        fhand = File.open("records.txt", "r")
        lines = fhand.readlines
        print lines.last
        fhand.close
        puts "--"*25
        puts "한 게임 더?: [y/n]"
        response = gets.chomp
        if response == 'y'
            try_count = 0
            numberrange = Array(0..9)
            numbers = numberrange.sample(4)
        else
            break
        end
    else
        puts "현재 #{try_count}번째 도전!"
        puts "현재 #{str_count}S #{bal_count}B입니다."
    end
end
