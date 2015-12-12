class role::gitlab_server(
){
  include profile::swap
  include profile::mta
  include profile::gitlab
}