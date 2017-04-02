aws_ssm_document_permission_describe() {
    local permission-type="$1"
    local name="$2"
    shift 2

    log_and_run aws ssm  --permission-type $permission_type --name $name "@"

}
