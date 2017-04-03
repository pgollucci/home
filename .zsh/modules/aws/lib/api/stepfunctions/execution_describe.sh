aws_stepfunctions_execution_describe() {
    local execution_arn="$1"
    shift 1

    log_and_run aws stepfunctions describe-execution --execution-arn $execution_arn "$@"
}
