aws_iam_mfa_device_resync() {
    local authentication-code-1="$1"
    local authentication-code-2="$2"
    local user-name="$3"
    local serial-number="$4"
    shift 4

    cond_log_and_run aws iam  --authentication-code-1 $authentication_code_1 --authentication-code-2 $authentication_code_2 --user-name $user_name --serial-number $serial_number "@"

}
