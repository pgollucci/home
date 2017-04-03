aws_route53_reusable_delegation_sets_list() {
    shift 0

    log_and_run aws route53 list-reusable-delegation-sets "$@"
}
