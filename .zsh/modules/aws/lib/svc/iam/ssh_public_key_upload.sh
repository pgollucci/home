aws_iam_ssh_public_key_upload() {
    local ssh-public-key-body="$1"
    local user-name="$2"
    shift 2

    cond_log_and_run aws iam  --ssh-public-key-body $ssh_public_key_body --user-name $user_name "@"

}
