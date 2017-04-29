aws_codestar_team_member_update() {
    local project_id="$1"
    local user_arn="$2"
    shift 2

    cond_log_and_run aws codestar update-team-member --project-id $project_id --user-arn $user_arn "$@"
}
