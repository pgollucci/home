aws_clouddirectory_read_batch() {
    local directory-arn="$1"
    local operations="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --operations $operations "@"

}
