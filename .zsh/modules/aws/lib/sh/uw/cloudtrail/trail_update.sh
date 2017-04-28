aws_cloudtrail_global_service_events() {
        local name="$1"
        shift 1

    cond_log_and_run aws cloudtrail update-trail --name $name --include-global-service-events "$@"
}

aws_cloudtrail_multi_region_trail() {
        local name="$1"
        shift 1

    cond_log_and_run aws cloudtrail update-trail --name $name --is-multi-region-trail "$@"
}

aws_cloudtrail_log_file_validation() {
        local name="$1"
        shift 1

    cond_log_and_run aws cloudtrail update-trail --name $name --enable-log-file-validation "$@"
}

