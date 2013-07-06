# RbFlex

Read remote flexget.log file and displays recent downloads
![screen cap](http://f.cl.ly/items/01413e3W1p1x1P1B1h3y/Screen%20Shot%202012-08-22%20at%202.23.19%20AM.png)@25

## Installation

### Clone this repo
    git clone https://github.com/sonkei/rbFlex.git
    cd rbFlex

### Build and install the gem
    gem build rbFlex.gemspec
    gem install rbFlex-0.1.0.gem

### Generate config file
    run rbFlex to generate intial skeleton config
    edit ~/.rbFlex.yml with your favorite editor

## Usage

### Print all downloads
    rbFlex

### Print downloads today
    rbFlex -t || rbFlex --today

### Print yesterdays downloads
    rbFlex -y || rbFlex --yesterday

### Delete the flexget.log file on remote machine
    rbFlex -d || rbFlex --delete

### Print help 
    rbFlex -h || rbFlex --help

## TODO
- clean up
- print day range

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
