aws_clouddirectory_write_batch() {
    local operations="$1"
    local directory-arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --operations $operations --directory-arn $directory_arn "@"

}
