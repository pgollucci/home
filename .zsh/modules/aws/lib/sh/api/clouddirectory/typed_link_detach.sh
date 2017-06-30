aws_clouddirectory_typed_link_detach() {
    local directory_arn="$1"
    local typed_link_specifier="$2"
    shift 2

    cond_log_and_run aws clouddirectory detach-typed-link --directory-arn $directory_arn --typed-link-specifier $typed_link_specifier "$@"
}
