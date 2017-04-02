aws_codecommit_repository_name_update() {
    local new-name="$1"
    local old-name="$2"
    shift 2

    cond_log_and_run aws codecommit  --new-name $new_name --old-name $old_name "@"

}
