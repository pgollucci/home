aws_iam_ssh_public_key_delete() {
    local user_name="$1"
    local ssh_public_key_id="$2"
    shift 2

    cond_log_and_run aws iam delete-ssh-public-key --user-name $user_name --ssh-public-key-id $ssh_public_key_id "$@"
}
