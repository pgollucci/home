aws_appstream_directory_config_delete() {
    local directory_name="$1"
    shift 1

    cond_log_and_run aws appstream delete-directory-config --directory-name $directory_name "$@"
}
