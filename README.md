# Gibson git

## Installation

Using [Berkshelf](http://berkshelf.com/), add the git cookbook to your Berksfile.

```ruby
    cookbook 'git', git: 'git@git.ldk.io:logankoester/gibson.git', rel: 'chef/cookbooks/git', branch: 'master'
```

Then run `berks` to install it.

## Default

Installs git & [git-extras](https://github.com/visionmedia/git-extras) system-wide.

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
