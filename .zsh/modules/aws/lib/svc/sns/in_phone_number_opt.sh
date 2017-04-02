aws_sns_in_phone_number_opt() {
    local phone-number="$1"
    shift 1

    cond_log_and_run aws sns  --phone-number $phone_number "@"

}
