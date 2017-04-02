aws_emr_applications_install() {
    local applications="$1"
    local cluster-id="$2"
    shift 2

    cond_log_and_run aws emr  --applications $applications --cluster-id $cluster_id "@"

}
