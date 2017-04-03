aws_ec2_host_reservation_purchase() {
    local offering_id="$1"
    local host_id_set="$2"
    shift 2

    cond_log_and_run aws ec2 purchase-host-reservation --offering-id $offering_id --host-id-set $host_id_set "$@"
}
