aws_rds_pending_maintenance_action_apply() {
    local apply-action="$1"
    local resource-identifier="$2"
    local opt-in-type="$3"
    shift 3

    cond_log_and_run aws rds  --apply-action $apply_action --resource-identifier $resource_identifier --opt-in-type $opt_in_type "@"

}
