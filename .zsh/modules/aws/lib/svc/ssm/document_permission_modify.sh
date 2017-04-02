aws_ssm_document_permission_modify() {
    local name="$1"
    local permission-type="$2"
    shift 2

    cond_log_and_run aws ssm  --name $name --permission-type $permission_type "@"

}
