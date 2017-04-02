aws_devicefarm_upload_create() {
    local type="$1"
    local project-arn="$2"
    local name="$3"
    shift 3

    cond_log_and_run aws devicefarm  --type $type --project-arn $project_arn --name $name "@"

}
