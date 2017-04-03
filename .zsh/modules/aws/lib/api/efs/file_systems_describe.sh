aws_efs_file_systems_describe() {
    shift 0

    log_and_run aws efs describe-file-systems "$@"
}
