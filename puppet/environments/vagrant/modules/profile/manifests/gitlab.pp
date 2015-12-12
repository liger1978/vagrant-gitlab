class profile::gitlab(
){
  yumrepo{ 'gitlab-ce':
    descr    => 'gitlab-ce',
    baseurl  => 'https://packages.gitlab.com/gitlab/gitlab-ce/el/7/$basearch',
    gpgcheck => 0,
  } ->
  package{'gitlab-ce':
    require => Service['postfix'],
  }
  file_line{ 'Mattermost external url':
    path    => '/etc/gitlab/gitlab.rb',
    line    => "mattermost_external_url 'http://mattermost.box'",
    match   => '^.*mattermost_external_url.*$',
    require => Package['gitlab-ce'],
    notify  => Exec['Reconfigure gitlab'],
  }
  file_line{ 'Mattermost enable':
    path    => '/etc/gitlab/gitlab.rb',
    line    => "mattermost['enable'] = true",
    match   => "^.*mattermost\\['enable'\\].*$",
    require => Package['gitlab-ce'],
    notify  => Exec['Reconfigure gitlab'],
  }
  file_line{ 'Mattermost team listing':
    path    => '/etc/gitlab/gitlab.rb',
    line    => "mattermost['team_enable_team_listing'] = true",
    match   => "^.*mattermost\\['team_enable_team_listing'\\].*$",
    require => Package['gitlab-ce'],
    notify  => Exec['Reconfigure gitlab'],
  }
  exec { 'Reconfigure gitlab':
    command     => '/bin/seq 3 | /bin/xargs -I{} /bin/gitlab-ctl reconfigure',
    timeout     => 1800,
    refreshonly => true,
  }
  firewall{ '100 allow http and https access':
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }
}