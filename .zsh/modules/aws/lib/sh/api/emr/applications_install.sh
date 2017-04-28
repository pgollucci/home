aws_emr_applications_install() {
    local cluster_id="$1"
    local applications="$2"
    shift 2

    cond_log_and_run aws emr install-applications --cluster-id $cluster_id --applications $applications "$@"
}
