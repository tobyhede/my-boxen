require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git'],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  # include dnsmasq
  include git

  # fail if FDE is not enabled
  # if $::root_encrypted == 'no' {
  #   fail('Please enable full disk encryption and try again')
  # }

  # default ruby versions
  include ruby::1_9_3
  include ruby::2_0_0

  class { 'ruby::global':
    version => '2.0.0'
  }
  ruby::version {"1.9.3-p374": }
  ruby::version {"1.9.3-p448": }

  ruby::gem { "bundler":
    gem     => 'bundler',
    ruby    =>  '2.0.0',
    version => '~> 1.3.0'
  }

  ruby::gem { "rails":
    gem     => 'rails',
    ruby    => '2.0.0',
    version => '~> 4.0.0'
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  include openssl

  include adium
  include dockutil
  include dropbox
  include github_for_mac
  include iterm2::stable
  include firefox
  include macvim
  include mysql
  include postgresql
  include pow
  include redis
  include skype
  include spotify
  include sysctl
  include tunnelblick
  include vagrant
  include virtualbox
  include sublime_text_2
  include steam
  include transmission
  include zsh
  include ohmyzsh

  # # include go
  # include go::1_1
  # curl -Lo- https://bit.ly/janus-bootstrap | bash

  dockutil::item { 'Add Chrome':
        item     => "/Applications/Google Chrome.app",
        label    => "Google Chrome",
        action   => "add",
        position => 4,
    }

  dockutil::item { 'Add Firefox':
        item     => "/Applications/Firefox.app",
        label    => "Firefox",
        action   => "add",
        position => 5,
  }

  dockutil::item { 'Add iTerm':
        item     => "/Applications/iTerm.app",
        label    => "iTerm",
        action   => "add",
        position => 6,
    }

  dockutil::item { 'Add MacVim':
        item     => "/opt/boxen/homebrew/Cellar/macvim/7.3-66/MacVim.app",
        label    => "MacVim",
        action   => "add",
        position => 7,
  }


  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
