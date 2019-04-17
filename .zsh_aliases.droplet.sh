projup() {
  erbmstop || return $?
  gpull || return $?
  _pcmd rvm use
  rvm use || return $?
  _pcmd nvm use default
  nvmud || return $?
  _pcmd bundle install
  bundle install || return $?
  erbmstart || return $?
}