aws_route53_reusable_delegation_set_create() {
    local caller_reference="$1"
    shift 1

    cond_log_and_run aws route53 create-reusable-delegation-set --caller-reference $caller_reference "$@"
}
