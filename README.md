# git cookbook

## Installation

Using [Berkshelf](http://berkshelf.com/), add the git cookbook to your Berksfile.

```ruby
cookbook 'git', git: 'git@github.com:logankoester/chef-git.git', branch: 'master'
```

Then run `berks` to install it.

## Default

* Installs git
* Installs [git-extras](https://github.com/visionmedia/git-extras)
* Installs [hub](https://github.com/github/hub)
* Installs [gist](https://github.com/defunkt/gist) & [gister](https://github.com/weakish/gister)
* Installs [gitsh](https://github.com/thoughtbot/gitsh)

### Usage

Add `recipe[git::default]` to your run list.

## Development

    # Start an archlinux vm
    cd git
    vagrant up 

    # Edit files...

    # Run again
    vagrant provision 

    # Verify
    vagrant ssh

## Author

Author:: Logan Koester (<logan@logankoester.com>)
