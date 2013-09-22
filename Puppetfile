# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

# github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "adium",         "1.1.1"
github "chrome",        "1.1.1"
github "dockutil",      "0.1.2"
github "dropbox",       "1.1.1"
github "iterm2",        "1.0.2"
github "github_for_mac","1.0.1"
github "heroku",        "2.0.0"
github "macvim",        "1.0.0"
github "firefox",       "1.1.1"
github "mysql",         "1.1.3"
github "osx",           "1.4.0"
#github "phantomjs",     "2.0.2"
github "postgresql",    "1.0.4"
github "pow",           "1.0.0"
github "redis",         "1.0.0"
github "skype",         "1.0.3"
github "spotify",       "1.0.1"
github "sublime_text_2","1.1.1"
github "steam",         "1.0.1"
github "sysctl",        "1.0.0"
github "tunnelblick",   "1.0.1"
github "transmission",  "1.0.0"
github "vagrant",       "2.0.10"
github "virtualbox",    "1.0.5"
github "vlc",           "1.0.4"
github "zsh",           "1.0.0"
github "ohmyzsh",       "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "go",            "1.0.0"
