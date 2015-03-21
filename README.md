# Proxynova

Simple library to retrieve public IPs, PORT and other details such as speed, uptime, anonymity level, last check etc. Proxinova also comes with a commandline utility. This library relys on the [Proxynova Website](http://www.proxynova.com/) to function properly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'proxynova'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proxynova

## Usage in your code
Calling `Proxynova.get_list` method returns an array containing hashes of proxy address details as shown in the example below

```ruby
require 'proxynova'
proxies = Proxynova.get_list
puts proxies
```

##### Result
```ruby
{:ip=>"173.218.180.170", :port=>"8080", :last_check=>"2015-03-21 18:36:30Z", :speed=>100.0, :uptime=>"100%", :country=>"United States - Tyler", :anonymity=>"Transparent"}
{:ip=>"167.114.144.14", :port=>"3128", :last_check=>"2015-03-21 18:36:29Z", :speed=>100.0, :uptime=>"62%", :country=>"United States - Mcallen", :anonymity=>"Elite"}
{:ip=>"107.17.100.254", :port=>"8080", :last_check=>"2015-03-21 18:33:36Z", :speed=>100.0, :uptime=>"30%", :country=>"United States", :anonymity=>"Anonymous"}
{:ip=>"107.182.17.9", :port=>"7808", :last_check=>"2015-03-21 18:33:26Z", :speed=>100.0, :uptime=>"91%", :country=>"United States", :anonymity=>"Elite"}
{:ip=>"107.155.77.119", :port=>"7808", :last_check=>"2015-03-21 18:33:26Z", :speed=>100.0, :uptime=>"89%", :country=>"United States", :anonymity=>"Elite"}
{:ip=>"191.240.150.153", :port=>"8080", :last_check=>"2015-03-21 18:33:23Z", :speed=>21.44, :uptime=>"27%", :country=>"United States - Marina Del Rey", :anonymity=>"Transparent"}
```

## Commandline Usage
Proxynova comes with a simple commandline utlity `proxynova` for quick retrieval of public proxy details. By default calling `proxynova` without an argument will return proxy servers from the United States. If you wish to return proxy servers for example from Russia you need to provide the ISO 2-letter code as the argument.

```
proxynova ru
```

##### Result
```
IP ADDRESS      PORT    SPEED   UPTIME    LAST CHECK              ANONYMITY   LOCATION
80.79.241.30    8080    38.86   21%       2015-03-21 18:32:05Z    Transparent Russia - Saint Petersburg
79.140.66.218   8080    22.98   37%       2015-03-21 18:31:59Z    Transparent Russia
109.60.249.107  3128    100.0   24%       2015-03-21 18:31:57Z    Transparent Russia - Ivanovo
80.252.155.139  8080    16.74   24%       2015-03-21 18:31:55Z    Transparent Russia
77.37.218.19    8080    26.6    33%       2015-03-21 18:31:25Z    Transparent Russia - Moscow
77.37.130.244   8080    40.74   31%       2015-03-21 18:31:23Z    Elite   Russia - Moscow
62.176.27.228   3128    38.38   27%       2015-03-21 18:31:01Z    Transparent Russia
62.205.162.68   3128    69.6    23%       2015-03-21 18:31:00Z    Transparent Russia
195.114.125.81  8080    23.95   58%       2015-03-21 18:29:31Z    Transparent Russia
178.166.155.36  8080    27.19   25%       2015-03-21 18:29:14Z    Transparent Russia - Krasnoyarsk
213.79.96.90    8080    31.4    40%       2015-03-21 18:27:29Z    Transparent Russia
188.130.128.243 80      100.0   52%       2015-03-21 18:25:21Z    Transparent Russia
```

## Contributing

1. Fork it ( https://github.com/nukturnal/proxynova/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
