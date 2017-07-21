aws_ds_number_of_domain_controllers_update() {
    local directory_id="$1"
    local desired_number="$2"
    shift 2

    cond_log_and_run aws ds update-number-of-domain-controllers --directory-id $directory_id --desired-number $desired_number "$@"
}
