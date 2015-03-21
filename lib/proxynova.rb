require "proxynova/version"
require 'nokogiri'
require 'open-uri'

module Proxynova
  BASE_URL = 'http://www.proxynova.com/proxy-server-list/country-'
  DEFAULT_COUNTRY = 'US'
  DEFAULT_URL = BASE_URL+DEFAULT_COUNTRY.downcase

  # Default Proxy IP List country is US
  # This is simply an appending of the URL based on the currently url structure of proxynova.com
  def self.get_list(country = DEFAULT_COUNTRY)
    proxies = []
    base_url = country.nil? ?  DEFAULT_URL : BASE_URL+country.downcase
    page = Nokogiri::HTML(open(base_url))
    proxy_table = page.search('#tbl_proxy_list tr')
    proxy_table.each do |row|
      data = row.search('td')
      if data.count >= 7
        proxies << {
          ip: clean(data[0].text.strip),
          port: clean(data[1].text.strip),
          last_check: clean(data[2].search('.timeago').attr('datetime').text.strip),
          speed: data[3].search('.progress-bar').attr('data-value').text.strip.to_f.round(2),
          uptime: clean(data[4].text.strip),
          country: clean(data[5].text.strip),
          anonymity: clean(data[6].text.strip)
        }
      end
    end
    proxies
  end

  def self.print
    proxies = get_list
    puts "IP ADDRESS\tPORT\tSPEED\tUPTIME\tLAST CHECK\t\tANONYMITY\tLOCATION"
    proxies.each do |proxy|
      puts "#{proxy[:ip]}\t#{proxy[:port]}\t#{proxy[:speed]}\t#{proxy[:uptime]}\t#{proxy[:last_check]}\t#{proxy[:anonymity]}\t#{proxy[:country]}"
    end
  end

  private
  # Quick Cleanup of string
  def self.clean(str)
    str.gsub(/[^[:print:]]/,'').split.join(' ')
  end
end
