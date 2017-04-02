aws_kms_alias_delete() {
    local alias-name="$1"
    shift 1

    cond_log_and_run aws kms  --alias-name $alias_name "@"

}
