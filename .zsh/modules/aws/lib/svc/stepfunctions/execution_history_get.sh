aws_stepfunctions_execution_history_get() {
    local execution-arn="$1"
    shift 1

    log_and_run aws stepfunctions  --execution-arn $execution_arn "@"

}
