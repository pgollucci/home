aws_kms_grant_retire() {

    cond_log_and_run aws kms retire-grant "$@"
}
