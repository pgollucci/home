aws_iam_roles_list() {

    log_and_run aws iam list-roles "$@"
}
