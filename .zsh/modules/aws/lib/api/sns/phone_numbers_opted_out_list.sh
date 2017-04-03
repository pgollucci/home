aws_sns_phone_numbers_opted_out_list() {
    shift 0

    log_and_run aws sns list-phone-numbers-opted-out "$@"
}
