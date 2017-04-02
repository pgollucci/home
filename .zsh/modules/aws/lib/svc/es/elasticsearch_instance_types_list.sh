aws_es_elasticsearch_instance_types_list() {
    local elasticsearch-version="$1"
    shift 1

    log_and_run aws es  --elasticsearch-version $elasticsearch_version "@"

}
