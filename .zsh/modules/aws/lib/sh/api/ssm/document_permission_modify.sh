aws_ssm_document_permission_modify() {
    local name="$1"
    local permission_type="$2"
    shift 2

    cond_log_and_run aws ssm modify-document-permission --name $name --permission-type $permission_type "$@"
}
