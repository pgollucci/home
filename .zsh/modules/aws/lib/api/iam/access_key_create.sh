aws_iam_access_key_create() {

    cond_log_and_run aws iam create-access-key "$@"
}
