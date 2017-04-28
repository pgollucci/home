aws_batch_compute_environment_create() {
    local compute_environment_name="$1"
    local type="$2"
    local service_role="$3"
    shift 3

    cond_log_and_run aws batch create-compute-environment --compute-environment-name $compute_environment_name --type $type --service-role $service_role "$@"
}
