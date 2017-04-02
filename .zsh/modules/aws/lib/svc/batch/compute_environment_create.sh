aws_batch_compute_environment_create() {
    local service-role="$1"
    local compute-environment-name="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws batch  --service-role $service_role --compute-environment-name $compute_environment_name --type $type "@"

}
