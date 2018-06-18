require ('colorize')
require ('rubygems')

def blink;          "\e[5m#{self}\e[25m" end
def brown;          "\e[33m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end

def main
	secret_number = rand(1..50).to_i
	puts secret_number
	s_num(secret_number)
end

def s_num(secret_number)
	n = 1
	number = []
	until n > 5
		print "Input your number (1-50) ,hint or secert  "
        i = gets.chomp
        if i.downcase == "hint"
        	hint(secret_number)
        elsif i.downcase == "secret"
			puts "secret number is  #{secret_number} ".blink
        else
        	i = i.to_i
        		if i < 1 || i > 50
        			puts "Answer isn't in scope(1-50)"
        next
        		elsif number.include? (i)
        			puts "Answer is duplicate".yellow 
        next

	    		elsif i < secret_number
					puts "your number less than secret number".red
	    		elsif i > secret_number
		 			puts "your number more than secret number".blue
	    		elsif i == secret_number
	  	 			puts "This is secret number".magenta
	  				break
	    		end
	    number[n] = i
		end
		n += 1
	end

	if n >= 5
			puts "secert number is  #{secret_number} ".green
	end

end

def hint(num)

	r_number = rand(2..8).to_i
	num1 = num - r_number
	num2 = num + r_number

	if(num1 < 0)
		num1 = 0
	end
	if(num2 > 50)
		num2 = 50
	end
	puts "secret number between (#{num1} to #{num2})".green
end

main if __FILE__ == $0
	
