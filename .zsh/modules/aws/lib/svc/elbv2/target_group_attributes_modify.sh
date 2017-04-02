aws_elbv2_target_group_attributes_modify() {
    local attributes="$1"
    local target-group-arn="$2"
    shift 2

    log_and_run aws elbv2  --attributes $attributes --target-group-arn $target_group_arn "@"

}
