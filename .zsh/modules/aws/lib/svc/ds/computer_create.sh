aws_ds_computer_create() {
    local computer-name="$1"
    local password="$2"
    local directory-id="$3"
    shift 3

    cond_log_and_run aws ds  --computer-name $computer_name --password $password --directory-id $directory_id "@"

}
