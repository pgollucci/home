aws_ds_computer_create() {
    local directory_id="$1"
    local computer_name="$2"
    local password="$3"
    shift 3

    cond_log_and_run aws ds create-computer --directory-id $directory_id --computer-name $computer_name --password $password "$@"
}
