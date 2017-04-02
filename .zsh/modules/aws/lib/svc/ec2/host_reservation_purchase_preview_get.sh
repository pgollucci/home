aws_ec2_host_reservation_purchase_preview_get() {
    local offering-id="$1"
    local host-id-set="$2"
    shift 2

    log_and_run aws ec2  --offering-id $offering_id --host-id-set $host_id_set "@"

}
