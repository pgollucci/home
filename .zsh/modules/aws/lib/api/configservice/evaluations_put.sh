aws_configservice_evaluations_put() {
    local result_token="$1"
    shift 1

    cond_log_and_run aws configservice put-evaluations --result-token $result_token "$@"
}
