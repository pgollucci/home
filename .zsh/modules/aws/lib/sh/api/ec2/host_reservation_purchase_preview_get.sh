aws_ec2_host_reservation_purchase_preview_get() {
    local host_id_set="$1"
    local offering_id="$2"
    shift 2

    log_and_run aws ec2 get-host-reservation-purchase-preview --host-id-set $host_id_set --offering-id $offering_id "$@"
}
