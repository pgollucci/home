aws_iam_ssh_public_key_delete() {
    local ssh-public-key-id="$1"
    local user-name="$2"
    shift 2

    cond_log_and_run aws iam  --ssh-public-key-id $ssh_public_key_id --user-name $user_name "@"

}
