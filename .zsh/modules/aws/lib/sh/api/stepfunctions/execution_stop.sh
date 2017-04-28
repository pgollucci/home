aws_stepfunctions_execution_stop() {
    local execution_arn="$1"
    shift 1

    cond_log_and_run aws stepfunctions stop-execution --execution-arn $execution_arn "$@"
}
