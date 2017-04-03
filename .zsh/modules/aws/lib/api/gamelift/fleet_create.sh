aws_gamelift_fleet_create() {
    local name="$1"
    local build_id="$2"
    local ec2_instance_type="$3"
    shift 3

    cond_log_and_run aws gamelift create-fleet --name $name --build-id $build_id --ec2-instance-type $ec2_instance_type "$@"
}
