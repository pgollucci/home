aws_iam_mfa_device_resync() {
    local user_name="$1"
    local serial_number="$2"
    local authentication_code_1="$3"
    local authentication_code_2="$4"
    shift 4

    cond_log_and_run aws iam resync-mfa-device --user-name $user_name --serial-number $serial_number --authentication-code-1 $authentication_code_1 --authentication-code-2 $authentication_code_2 "$@"
}
