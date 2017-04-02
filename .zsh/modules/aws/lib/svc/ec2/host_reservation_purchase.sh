aws_ec2_host_reservation_purchase() {
    local offering-id="$1"
    local host-id-set="$2"
    shift 2

    cond_log_and_run aws ec2  --offering-id $offering_id --host-id-set $host_id_set "@"

}
