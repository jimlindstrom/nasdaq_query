require 'nokogiri'
require 'date'

module NasdaqQuery
  class DividendHistory
    def self.for_symbol(sym)
      doc = Nokogiri::HTML(`curl -s 'http://www.nasdaq.com/symbol/#{sym}/dividend-history'`)
      rows = doc.xpath("//table[@class='dataGrid']/tr")
      rows.shift # skip the header row
      entries = rows.map do |row|
        tds = row.xpath(".//td")
        { 
          :ex_eff_date      => begin; Date.strptime(tds[0].xpath(".//span").text, "%m/%d/%Y"); rescue; nil; end,
          :type             => tds[1].text,
          :cash_amt         => tds[2].xpath(".//span").text.to_f,
          :declaration_date => begin; Date.strptime(tds[3].xpath(".//span").text, "%m/%d/%Y"); rescue; nil; end,
          :record_date      => begin; Date.strptime(tds[4].xpath(".//span").text, "%m/%d/%Y"); rescue; nil; end,
          :payment_date     => begin; Date.strptime(tds[5].xpath(".//span").text, "%m/%d/%Y"); rescue; nil; end
        }
      end
    end
  end
end


