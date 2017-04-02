aws_snowball_cluster_create() {
    local resources="$1"
    local role-arn="$2"
    local address-id="$3"
    local job-type="$4"
    local shipping-option="$5"
    shift 5

    cond_log_and_run aws snowball  --resources $resources --role-arn $role_arn --address-id $address_id --job-type $job_type --shipping-option $shipping_option "@"

}
