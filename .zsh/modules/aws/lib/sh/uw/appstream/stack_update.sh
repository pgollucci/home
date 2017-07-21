aws_appstream_storage_connectors() {
        local name="$1"
        shift 1

    cond_log_and_run aws appstream update-stack --name $name --delete-storage-connectors "$@"
}

