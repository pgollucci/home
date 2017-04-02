aws_stepfunctions_execution_describe() {
    local execution-arn="$1"
    shift 1

    log_and_run aws stepfunctions  --execution-arn $execution_arn "@"

}
