aws_iam_ssh_public_key_upload() {
    local user_name="$1"
    local ssh_public_key_body="$2"
    shift 2

    cond_log_and_run aws iam upload-ssh-public-key --user-name $user_name --ssh-public-key-body $ssh_public_key_body "$@"
}
