aws_codebuild_project_create() {
    local name="$1"
    local source="$2"
    local artifacts="$3"
    local environment="$4"
    shift 4

    cond_log_and_run aws codebuild create-project --name $name --source $source --artifacts $artifacts --environment $environment "$@"
}
