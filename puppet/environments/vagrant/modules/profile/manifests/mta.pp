class profile::mta(
){
  package{'postfix':
  } ->
  service { 'postfix':
    ensure => 'running',
    enable => true,
  }
}