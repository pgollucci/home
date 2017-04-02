aws_stepfunctions_execution_stop() {
    local execution-arn="$1"
    shift 1

    cond_log_and_run aws stepfunctions  --execution-arn $execution_arn "@"

}
