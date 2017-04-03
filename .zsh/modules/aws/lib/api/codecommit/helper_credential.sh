aws_codecommit_helper_credential() {
    shift 0

    cond_log_and_run aws codecommit credential-helper "$@"
}
