aws_clouddirectory_directory_disable() {
    local directory-arn="$1"
    shift 1

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn "@"

}
