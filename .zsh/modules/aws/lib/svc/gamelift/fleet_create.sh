aws_gamelift_fleet_create() {
    local build-id="$1"
    local name="$2"
    local ec2-instance-type="$3"
    shift 3

    cond_log_and_run aws gamelift  --build-id $build_id --name $name --ec2-instance-type $ec2_instance_type "@"

}
