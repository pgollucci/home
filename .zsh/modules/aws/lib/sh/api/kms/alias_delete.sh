aws_kms_alias_delete() {
    local alias_name="$1"
    shift 1

    cond_log_and_run aws kms delete-alias --alias-name $alias_name "$@"
}
