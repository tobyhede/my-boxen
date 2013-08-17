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

github "boxen", "2.3.6"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

# github "dnsmasq",    "1.0.0"
github "gcc",        "1.0.0"
github "git",        "1.2.2"
github "homebrew",   "1.1.2"
github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
github "openssl",    "1.0.0"
github "repository", "2.0.2"
github "ruby",       "4.1.0"
github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"


# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "adium",         "1.1.1"
github "dockutil",      "0.1.2"
github "dropbox",       "1.1.1"
github "iterm2",        "1.0.2"
github "github_for_mac","1.0.1"
github "macvim",        "1.0.0"
github "firefox",       "1.1.1"
github "mysql",         "1.1.3"
github "osx",           "1.4.0"
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
github "zsh",           "1.0.0"
github "ohmyzsh",       "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "go",            "1.0.0"
