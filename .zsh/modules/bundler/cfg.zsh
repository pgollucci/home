_setup() {

    local cores_num="$(sysctl hw.ncpu | awk '{print $2}')"
    alias be="bundle exec"
    alias bl="bundle list"
    alias bp="bundle package"
    alias bo="bundle open"
    alias bout="bundle outdated"
    alias bu="bundle update"
    alias bi="bundle_install"
    alias bcn="bundle clean"
    alias bi="bundle install --jobs=$cores_num"
}

__setup
