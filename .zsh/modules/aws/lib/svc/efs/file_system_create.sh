aws_efs_file_system_create() {
    local creation-token="$1"
    shift 1

    cond_log_and_run aws efs  --creation-token $creation_token "@"

}
