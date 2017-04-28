aws_ds_directory_create() {
    local name="$1"
    local password="$2"
    local size="$3"
    shift 3

    cond_log_and_run aws ds create-directory --name $name --password $password --size $size "$@"
}
