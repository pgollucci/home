aws_clouddirectory_directory_delete() {
    local directory_arn="$1"
    shift 1

    cond_log_and_run aws clouddirectory delete-directory --directory-arn $directory_arn "$@"
}
