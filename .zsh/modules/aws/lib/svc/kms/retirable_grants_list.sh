aws_kms_retirable_grants_list() {
    local retiring-principal="$1"
    shift 1

    log_and_run aws kms  --retiring-principal $retiring_principal "@"

}
