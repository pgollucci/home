aws_gamelift_build_upload() {
    local name="$1"
    local build-version="$2"
    local build-root="$3"
    shift 3

    cond_log_and_run aws gamelift  --name $name --build-version $build_version --build-root $build_root "@"

}
