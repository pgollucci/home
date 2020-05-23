p6df::modules::home::version() { echo "0.0.1" }

p6df::modules::home::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/README.md README.md
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/LICENSE LICENSE

  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.fullname .fullname
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.hosts .hosts
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.organization .organization
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.signature .signature

  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home-private/ssh .ssh
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home-private/gnupg .gnupg
}

p6df::modules::home::init() {

  export HOMEBREW_GITHUB_API_TOKEN=$P6_GH_TOKEN
}

