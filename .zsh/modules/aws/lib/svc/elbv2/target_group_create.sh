aws_elbv2_target_group_create() {
    local protocol="$1"
    local port="$2"
    local name="$3"
    local vpc-id="$4"
    shift 4

    log_and_run aws elbv2  --protocol $protocol --port $port --name $name --vpc-id $vpc_id "@"

}
