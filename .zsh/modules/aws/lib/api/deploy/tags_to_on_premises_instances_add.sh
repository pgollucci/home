aws_deploy_tags_to_on_premises_instances_add() {
    local tags="$1"
    local instance_names="$2"
    shift 2

    cond_log_and_run aws deploy add-tags-to-on-premises-instances --tags $tags --instance-names $instance_names "$@"
}
