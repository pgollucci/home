#    local subject="/C=US/ST=MD/L=Upper Marlboro/O=${AWS_ORG}/OU=Technology/CN=$account_alias"
aws_org_account_make() {
    local org="$1"
    local account_email="$2"
    local account_alias="$3"
    local saml_provider="$4"
    local saml_provider_email="$5"
    local role_full_path="$6"
    local cert_subject="$7"
    local cert_bits="$8"
    local cert_exp="$9"
    local policy_arn="${10:-arn:aws:iam::aws:policy/AdministratorAccess}"

    # lookup account, if not found, make it
    aws_org_account_create_or_fetch "$account_alias" "$account_email"

    # configure: iam password policy
    aws_org_run_as "$account_alias" "aws_iam_password_policy_default"

    # configure: iam account signin link
    aws_org_run_as "$account_alias" "aws_iam_signin_link $account_alias"

    # configure: sts disable all (should 'activate' the ones needed)
    # aws_org_run_as "$account_alias" "aws_sts_regions_disable $account_email"

    # configure: delete all root ACCESS_KEYS
    # aws_org_run_as "$account_alias" "aws_sts_root_keys_delete $account_email"

    # configure: enable mfa for root
    # aws_org_run_as "$account_alias" "aws_sts_root_mfa_enable $account_email"

    # create the SAML provider peices Remote and AWS
    aws_org_saml_make "$account_alias" "$account_id" "$cert_bits" "$cert_exp" "$cert_subject" "$org" "$role_full_path" "$saml_provider" "$saml_provider_email"

    # configure: make an STS SAML Role which uses the IDP above
    aws_org_run_as "$account_alias" "aws_iam_role_saml_create $role_full_path $account_id $provider"

    # condigure: attach the aws admin policy to the above role
    aws_org_run_as "$account_alias" "aws_iam_policy_to_role $role_full_path $policy_arn"
}

aws_org_saml_make() {
    local account_alias="$1"
    local account_id="$2"
    local cert_bits="$3"
    local cert_exp="$4"
    local cert_subject="$5"
    local role_full_path="$6"
    local saml_provider="$7"
    local saml_provider_email="$8"

    local saml_file=$(jc_app_create "$org" "$account_id" "$cert_subject" "$cert_bits" "$cert_exp" "$saml_provider" "$saml_provider_email" "$role_full_path")

    aws_org_run_as "$account_alias" "aws_iam_idp_create file://$saml_file $saml_provider"

    # XXX: commit to github
#   transient_delete "$saml_file"
}

aws_org_account_create_or_fetch() {
    local account_alias="$1"
    local account_email="$2"

    local account_id=$(aws_util_account_alias_to_id "$account_alias")
    if [ -z "$account_id" ]; then
	account_id=$(aws_org_account_create "$account_email" "$account_alias")
	aws_util_account_map "$account_id" "$account_alias"
    fi

    echo $account_id
}

aws_org_account_create() {
    local email="$1"
    local account_alias="$2"

    local car=$(_aws_account_create "$account_email" --account-name "$account_alias" | json_key_2_value "Id" "-")

    aws_org_account_wait_for "$car"

    aws_org_account_id_from_alias "$account_alias"
}

_aws_org_account_create() {
    local account_email="$1"
    local account_alias="$2"

    aws organizations create-account --email $account_email --account-name $account_alias
}

aws_org_account_id_from_alias() {

    aws --output text organizations list-accounts --query 'Accounts[].[Id, Name]' | awk -v k=$alias '$2 ~ k { print $1 }'
}

aws_org_account_create_status() {
    local car="$1"

    aws --output text organizations describe-create-account-status --create-account-request-id $car --query "CreateAccountStatus.State"
}

aws_org_account_wait_for() {
    local car="$1"

    [ -n "${DRY_RUN}" ] && return

    local i=1
    while [ : ]; do
	local status=$(aws_org_account_create_status "$car")

	[ x"$status" = x"ACTIVE" ] && break
	[ x"$status" = x"FAILED" ] && exit 15

	log "Waiting for ${name}: $i seconds"
	i=$(doubling_backoff_retry $i)
    done
}

aws_org_run_as() {
    local alias="$1"
    local cmd="$2"

    # Get Privs
    aws_sts_org_su "$alias"

    echo "$cmd"
    eval "$cmd"

    # Drop Prvis
    aws_sts_unassume_role
}
