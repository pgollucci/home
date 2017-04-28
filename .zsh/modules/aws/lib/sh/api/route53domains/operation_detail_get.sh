aws_route53domains_operation_detail_get() {
    local operation_id="$1"
    shift 1

    log_and_run aws route53domains get-operation-detail --operation-id $operation_id "$@"
}
