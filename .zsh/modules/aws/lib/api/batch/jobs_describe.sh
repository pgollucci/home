aws_batch_jobs_describe() {
    local jobs="$1"
    shift 1

    log_and_run aws batch describe-jobs --jobs $jobs "$@"
}
