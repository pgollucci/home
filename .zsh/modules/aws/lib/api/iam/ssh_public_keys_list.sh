aws_iam_ssh_public_keys_list() {
    shift 0

    log_and_run aws iam list-ssh-public-keys "$@"
}
