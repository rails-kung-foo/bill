# Bill
Bill is a single page app that displays the customer invoice.

It is crafted and hand-coded with Ruby and Ruby on Rails.

### How it works
Bill requests from an endpoint a JSON file and displays it to the user.

Default file is:

[http://safe-plains-5453.herokuapp.com/bill.json
](http://safe-plains-5453.herokuapp.com/bill.json)

Bill takes the parameter `billing_file=file_name.json` to request a different file.

#### Installation
- Clone repo and run `bundle install`
- start your server with `mysql.server start`
- Run `rspec --init` and add `--format documentation` to your .rspec file
- Run `rspec spec/` for tests.
