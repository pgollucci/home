aws_iam_mfa_device_enable() {
    local serial-number="$1"
    local authentication-code-2="$2"
    local user-name="$3"
    local authentication-code-1="$4"
    shift 4

    cond_log_and_run aws iam  --serial-number $serial_number --authentication-code-2 $authentication_code_2 --user-name $user_name --authentication-code-1 $authentication_code_1 "@"

}
