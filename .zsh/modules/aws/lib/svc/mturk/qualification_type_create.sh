aws_mturk_qualification_type_create() {
    local name="$1"
    local description="$2"
    local qualification-type-status="$3"
    shift 3

    cond_log_and_run aws mturk  --name $name --description $description --qualification-type-status $qualification_type_status "@"

}
