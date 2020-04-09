require 'rest-client'
require 'nokogiri'

def search(input)
    param = input.split(" ").join("+")
    @var = RestClient.get "https://www.bing.com/search?q=#{param}"
    @links = Nokogiri::HTML(@var.body)            
    puts "Elements in your search: #{@links.css('ol li h2 a').length}"
    @links.css('ol li h2 a').map do |link|
        puts "#{link.text}"
        puts "*****"
        puts "#{link['href']}"
        puts "*****"
    end
end

puts "Search Power"
puts "Powered by Bing"
sleep(1)
puts "Add the keywords of your search in Bing: "
input = gets.chomp
search(input)
puts "Do you want to get the headers, the body and the cookies? (y/n)"
input2 = gets.chomp
if input2 == "y"
     puts "The headers are: #{@var.headers}"
     sleep (2)
     puts "The body of your search is : #{@var.body}"
     sleep (2)
     puts "The cookies are : #{@var.cookies}"
end