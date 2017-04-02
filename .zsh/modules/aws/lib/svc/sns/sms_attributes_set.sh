aws_sns_sms_attributes_set() {
    local attributes="$1"
    shift 1

    cond_log_and_run aws sns  --attributes $attributes "@"

}
