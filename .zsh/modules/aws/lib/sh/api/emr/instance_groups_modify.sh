aws_emr_instance_groups_modify() {

    cond_log_and_run aws emr modify-instance-groups "$@"
}
