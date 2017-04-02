aws_ds_directory_create() {
    local name="$1"
    local size="$2"
    local password="$3"
    shift 3

    cond_log_and_run aws ds  --name $name --size $size --password $password "@"

}
