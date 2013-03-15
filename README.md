# NasdaqQuery

This gem initially includes just one feature: to look up a company's dividend history. This is useful for calculating a company's beta, which can be computed by a regression that includes, among other factors, a stock's cum-dividend earnings over time.

## Installation

Add this line to your application's Gemfile:

    gem 'nasdaq_query'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nasdaq_query

## Usage

Here's how you'd look up Apple's dividend history:

    require 'nasdaq_query'
    
    entries = NasdaqQuery::DividendHistory.for_symbol("aapl")
    entries.length     # => 32
    entries.first      # => {:ex_eff_date=>#<Date: 2013-02-07 ((2456331j,0s,0n),+0s,2299161j)>, 
                       #     :type=>"Cash", 
                       #     :cash_amt=>2.65, 
                       #     :declaration_date=>#<Date: 2013-01-23 ((2456316j,0s,0n),+0s,2299161j)>, 
                       #     :record_date=>#<Date: 2013-02-11 ((2456335j,0s,0n),+0s,2299161j)>, 
                       #     :payment_date=>#<Date: 2013-02-14 ((2456338j,0s,0n),+0s,2299161j)>}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
