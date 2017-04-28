aws_stepfunctions_execution_history_get() {
    local execution_arn="$1"
    shift 1

    log_and_run aws stepfunctions get-execution-history --execution-arn $execution_arn "$@"
}
