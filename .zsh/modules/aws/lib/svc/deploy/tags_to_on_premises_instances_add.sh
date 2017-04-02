aws_deploy_tags_to_on_premises_instances_add() {
    local instance-names="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws deploy  --instance-names $instance_names --tags $tags "@"

}
