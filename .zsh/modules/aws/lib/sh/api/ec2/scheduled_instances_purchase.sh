aws_ec2_scheduled_instances_purchase() {
    local purchase_requests="$1"
    shift 1

    cond_log_and_run aws ec2 purchase-scheduled-instances --purchase-requests $purchase_requests "$@"
}
