aws_ses_identity_notification_attributes_get() {
    local identities="$1"
    shift 1

    log_and_run aws ses get-identity-notification-attributes --identities $identities "$@"
}
