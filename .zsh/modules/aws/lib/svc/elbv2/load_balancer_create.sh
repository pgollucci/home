aws_elbv2_load_balancer_create() {
    local name="$1"
    local subnets="$2"
    shift 2

    cond_log_and_run aws elbv2  --name $name --subnets $subnets "@"

}
