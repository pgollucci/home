aws_datapipeline_for_task_poll() {
    local worker-group="$1"
    shift 1

    cond_log_and_run aws datapipeline  --worker-group $worker_group "@"

}
