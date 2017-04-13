aws_kms_random_generate() {

    cond_log_and_run aws kms generate-random "$@"
}
