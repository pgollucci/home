aws_redshift_reserved_node_offering_purchase() {
    local reserved-node-offering-id="$1"
    shift 1

    cond_log_and_run aws redshift  --reserved-node-offering-id $reserved_node_offering_id "@"

}
