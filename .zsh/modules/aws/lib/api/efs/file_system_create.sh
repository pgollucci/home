aws_efs_file_system_create() {
    local creation_token="$1"
    shift 1

    cond_log_and_run aws efs create-file-system --creation-token $creation_token "$@"
}
