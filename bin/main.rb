require 'rest-client'

def search(input)
    param = input.split(" ").join("+")
    @var = RestClient.get("https://www.bing.com/search?q=#{param}")
    puts "The cookies on this site are: #{@var.cookies}"
    puts "The code is: #{@var.code}" 
end

puts "Search Power"
puts "Powered by Bing"
sleep(1)
puts "Add the keywords of your search in Bing: "
input = gets.chomp
puts search(input)
puts "Do you want to get the headers and the body? (y/n)"
input2 = gets.chomp
if input2 == "y"
     puts "The headers are: #{@var.headers}"
     sleep (2)
     puts "The body of your search is : #{@var.body}"
end