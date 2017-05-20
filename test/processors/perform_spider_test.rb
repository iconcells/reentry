require 'test_helper'

class PerformSpiderTest < ActiveSupport::TestCase
  let(:domain) do
    Domain.create(
      url: 'http://www.shelterlistings.org/state/maryland.html'
    )
  end

  let(:details_page_url) {'http://www.shelterlistings.org/details/31018/'}
  

  describe '.get_website_html' do 
    it 'get maryland page' do
        VCR.use_cassette("shelter_listings_MD_html") do 
          assert PerformSpider.new.get_website_html(url: domain.url)
        end
    end

    it 'get details page' do
        VCR.use_cassette("shelter_listings_details_html") do 
          assert PerformSpider.new.get_website_html(url: details_page_url)
        end
    end
  end
end


