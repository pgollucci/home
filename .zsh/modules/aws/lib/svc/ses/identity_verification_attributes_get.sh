aws_ses_identity_verification_attributes_get() {
    local identities="$1"
    shift 1

    log_and_run aws ses  --identities $identities "@"

}
