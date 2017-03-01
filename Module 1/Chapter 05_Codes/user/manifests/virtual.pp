class user::virtual {
  @user { 'theresa': ensure => present }
  @user { 'josko':   ensure => present }
  @user { 'nate':    ensure => present }
  #@user { 'thomas':  ensure => present }
  @admin_user { 'thomas':
    key      => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDQ/ChcAwkB4zfh8ESENzPHq5d6AW9x4LwyhiREX2zOGg2N0I7W4Qa6RlWwnmwsDoIgBqHDfH4PZ45u5AsH07lfdCy3FhVPzm8SCMF5DN1EdgT93wQn0UFcb+KVXoS2OCtT24rm3++FB/8HGZflrDTxVWO0aeFsggpJ1M4QrwdHN2T/ACWFeZieY2IJsdLJkEIVboFR5LoaJtNziWup5SYKpI7M/C+DRwta/CiV7d9MeSF7psa8NaJSgOQ8o994eRyfP6US9dHAzz/mfPgWmp860Y0emZ9F3fsLGMMRaqMgOi8pZ1ZjrArLXRLKYuaeIZo1nZ930+TUG0/XaWM5sX0z',
    keytype  => 'ssh-rsa',
    dotfiles => true,
  }
}
