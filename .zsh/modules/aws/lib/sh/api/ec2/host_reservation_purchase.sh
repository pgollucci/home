aws_ec2_host_reservation_purchase() {
    local host_id_set="$1"
    local offering_id="$2"
    shift 2

    cond_log_and_run aws ec2 purchase-host-reservation --host-id-set $host_id_set --offering-id $offering_id "$@"
}
