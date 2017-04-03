aws_devicefarm_upload_create() {
    local project_arn="$1"
    local name="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws devicefarm create-upload --project-arn $project_arn --name $name --type $type "$@"
}
