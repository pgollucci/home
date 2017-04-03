aws_clouddirectory_directory_disable() {
    local directory_arn="$1"
    shift 1

    cond_log_and_run aws clouddirectory disable-directory --directory-arn $directory_arn "$@"
}
