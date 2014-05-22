require 'nokogiri'
require 'open-uri'
require 'csv'

#visit all tag/n in range below, dump tag #n to csv if valid
for n in 1..1100
	begin
		@page = Nokogiri::HTML(open("https://api.angel.co/1/tags/"+"#{n}"))
	rescue OpenURI::HTTPError => e 
		@output = CSV.open('results.csv', 'a+')
		@output << ["#{n}"]
		#uncomment next line if rate-limited
		#sleep(rand(2))
	end
end