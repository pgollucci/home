aws_codestar_team_member_associate() {
    local project_id="$1"
    local user_arn="$2"
    local project_role="$3"
    shift 3

    cond_log_and_run aws codestar associate-team-member --project-id $project_id --user-arn $user_arn --project-role $project_role "$@"
}
