aws_clouddirectory_directory_enable() {
    local directory_arn="$1"
    shift 1

    cond_log_and_run aws clouddirectory enable-directory --directory-arn $directory_arn "$@"
}
