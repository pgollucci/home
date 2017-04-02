aws_ds_directory_connect() {
    local password="$1"
    local name="$2"
    local connect-settings="$3"
    local size="$4"
    shift 4

    cond_log_and_run aws ds  --password $password --name $name --connect-settings $connect_settings --size $size "@"

}
