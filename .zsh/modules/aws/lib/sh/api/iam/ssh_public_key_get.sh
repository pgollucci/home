aws_iam_ssh_public_key_get() {
    local user_name="$1"
    local ssh_public_key_id="$2"
    local encoding="$3"
    shift 3

    log_and_run aws iam get-ssh-public-key --user-name $user_name --ssh-public-key-id $ssh_public_key_id --encoding $encoding "$@"
}
