aws_sns_if_phone_number_is_opted_out_check() {
    local phone-number="$1"
    shift 1

    cond_log_and_run aws sns  --phone-number $phone_number "@"

}
