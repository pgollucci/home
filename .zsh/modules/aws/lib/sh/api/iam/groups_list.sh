aws_iam_groups_list() {

    log_and_run aws iam list-groups "$@"
}
