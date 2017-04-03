aws_emr_instance_groups_modify() {
    shift 0

    cond_log_and_run aws emr modify-instance-groups "$@"
}
