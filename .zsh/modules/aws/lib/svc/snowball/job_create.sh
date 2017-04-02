aws_snowball_job_create() {
    shift 0

    cond_log_and_run aws snowball  "@"

}
