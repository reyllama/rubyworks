drinks = Hash.new(5)
drinks[:lemonade] = 5
drinks[:appleade] = 5
drinks[:peachade] = 5
drinks[:melonade] = 5

revenue = 0

puts "안녕하세요! 저희 자판기를 방문해주셔서 감사합니다!"
puts "언제나 고객님의 만족을 위해 최선을 다하는 자판기가 되겠습니다."
puts "아시겠지만 저희 자판기의 모든 품목은 단돈 1000원!"
puts "마음껏 이용하시면 되겠습니다~~~~~~*^^*"
while true
    while drinks.values.max>0 do
        puts "현재 저희 자판기의 재고입니다!"
        drinks.each do |k, v|
            drinks.delete(k) if drinks[k] ==0
        end
        print drinks
        puts ""
        puts "무엇을 드시겠어요?"
        answer = gets.chomp
        if drinks.keys.include? answer.to_sym
            puts "1000원입니다. 돈을 넣어주세요. (숫자만 써주세요 ^6^)"
            money = gets.chomp.to_i
            if money > 1000
                puts "어이쿠 꿀꺽! 감사합니다 ^6^"
            elsif money == 1000
                puts "돈 받았습니다!"
            elsif money < 1000
                while money < 1000 do
                    puts "아직 동전 찾고 계신거죠?"
                    money += gets.chomp.to_i
                end
                puts "돈 받았습니다!"
            else
                puts "현금만 받아요~"
                until money >= 1000 do
                    puts "돈을 넣어주세요."
                    money += gets.chomp.to_i
                end
                puts "돈 받았습니다!"
            end
            drinks[answer.to_sym] -= 1
            revenue += 1000
            fhand = File.new("sales.txt", "a")
            fhand.puts "1000 / #{Time.now}"
            fhand.close
            print drinks
            puts ""
            puts "더 드실건가요?: [y/n]"
            response = gets.chomp
            if response == 'n'
                break
            end
        else
            puts "그런 음료는 취급하지 않아요."
        end
    end
    if drinks.values.max == 0
        puts "자판기 재고가 바닥났습니다!"
        puts "잠시 점검을 갖겠습니다."
        puts "-"*76
        puts "딩기리딩딩딩 우우우웅 푸시시식"
        puts "-"*76
        fhand = File.new("sales.txt", "a")
        fhand.puts "-"*30 + '중간 매출 정산' + '-'*30
        fhand.puts "#{revenue}원"
        fhand.puts '-'*76
        fhand.close
        drinks = Hash.new(5)
        drinks[:lemonade] = 5
        drinks[:appleade] = 5
        drinks[:peachade] = 5
        drinks[:melonade] = 5
    else
        puts "이용해주셔서 감사합니다.^^"
        break
    end
end
