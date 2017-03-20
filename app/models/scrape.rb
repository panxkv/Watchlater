class Scrape
 attr_accessor :title, :vote, :image_url, :description, :failure

 def scrape_new_movie(url)
   begin
     doc = Nokogiri::HTML(open(url).read, nil, 'utf-8')
     doc.css('script').remove
     self.title = doc.css('#pw_title.about_movie_title').text
     v = doc.css('#success_vote').text
     self.vote = v.slice(2...5)
     iu = "http://www." + doc.css('.about_movie img').attr('src').text.slice(2...100)
     self.image_url  = iu
     self.description = doc.css('#pw_description.e_s3k').text
     return true
   rescue Exception => e
     self.failure = "Something went wrong with the scrape"
   end
  end
 end
