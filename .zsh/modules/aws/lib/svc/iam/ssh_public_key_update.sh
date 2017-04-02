aws_iam_ssh_public_key_update() {
    local user-name="$1"
    local ssh-public-key-id="$2"
    local status="$3"
    shift 3

    cond_log_and_run aws iam  --user-name $user_name --ssh-public-key-id $ssh_public_key_id --status $status "@"

}
