aws_datapipeline_task_runner_heartbeat_report() {
    local taskrunner_id="$1"
    shift 1

    cond_log_and_run aws datapipeline report-task-runner-heartbeat --taskrunner-id $taskrunner_id "$@"
}
