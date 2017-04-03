aws_es_elasticsearch_instance_types_list() {
    local elasticsearch_version="$1"
    shift 1

    log_and_run aws es list-elasticsearch-instance-types --elasticsearch-version $elasticsearch_version "$@"
}
