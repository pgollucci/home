aws_codecommit_repository_name_update() {
    local old_name="$1"
    local new_name="$2"
    shift 2

    cond_log_and_run aws codecommit update-repository-name --old-name $old_name --new-name $new_name "$@"
}
