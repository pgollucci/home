aws_lambda_enabled() {
        local uuid="$1"
        shift 1

    cond_log_and_run aws lambda update-event-source-mapping --uuid $uuid --enabled "$@"
}

