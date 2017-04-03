aws_elbv2_target_group_create() {
    local name="$1"
    local protocol="$2"
    local port="$3"
    local vpc_id="$4"
    shift 4

    log_and_run aws elbv2 create-target-group --name $name --protocol $protocol --port $port --vpc-id $vpc_id "$@"
}
