aws_clouddirectory_directory_get() {
    local directory_arn="$1"
    shift 1

    log_and_run aws clouddirectory get-directory --directory-arn $directory_arn "$@"
}
