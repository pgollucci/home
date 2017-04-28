aws_elasticbeanstalk_environment_info_request() {
    local info_type="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk request-environment-info --info-type $info_type "$@"
}
