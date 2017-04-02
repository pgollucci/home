aws_kms_random_generate() {
    shift 0

    cond_log_and_run aws kms  "@"

}
