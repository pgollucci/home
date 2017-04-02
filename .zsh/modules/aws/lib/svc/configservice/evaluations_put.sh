aws_configservice_evaluations_put() {
    local result-token="$1"
    shift 1

    cond_log_and_run aws configservice  --result-token $result_token "@"

}
