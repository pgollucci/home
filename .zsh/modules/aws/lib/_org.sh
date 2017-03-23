aws_org_account_make() {
    local email="$1"
    local alias="$2"

    aws_org_account_create "$email" "$alias"

    aws_org_run_as "$alias" "aws_iam_password_policy"
    aws_org_run_as "$alias" "aws_iam_signin_link $alias"
    #    aws_org_run_as "$alias" "sts_regions_disable.py --login $email"
    #    aws_org_run_as "$alias" "root_key_delete.py --login $email"
    #    aws_org_run_as "$alias" "root_mfa_enable.py --login $email"

    aws_org_run_as "$alias" "aws_iam_idp_create file:///path-1 JumpCloud"
    aws_org_run_as "$alias" "aws_iam_role_create file:///path-2"
}

aws_org_account_create() {
    local email="$1"
    local alias="$2"

    local dir=$(mktemp -d -t /tmp/aws-org)
    local file=$dir/create-account.json

    aws organizations create-account --email $email --account-name $alias > $file

    local car=$(_util_json_key_2_value "Id" "$file")
    aws_org_account_wait_for "$car"

    rm -rf $dir

    echo $car
}

aws_org_account_wait_for() {
    local car="$1"

    [ -n "${DRY_RUN}" ] && return

    local i=1
    while [ : ]; do
	local status=$(aws --output text organizations describe-create-account-status --create-account-request-id car-0be354c0100811e78db450d5029d06f1 --query "CreateAccountStatus.State")

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

aws_iam_role_create() {
    local json="$1"

    aws iam create-role --path /SSO/ --role-name SSO_Admin --assume-role-policy-document $json
    aws iam attach-role-policy --role-name SSO_Admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
}

aws_iam_idp_create() {
    local json="$1"
    local name="$2"

    aws iam create-saml-provider --saml-metadata-document $json --name $name
}

aws_iam_password_policy() {

    aws iam update-account-password-policy \
	--minimum-password-length 12 \
	--require-symbols \
	--require-numbers \
	--require-uppercase-characters \
	--require-lowercase-characters \
	--allow-users-to-change-password \
	--max-password-age 1095 \
	--password-reuse-prevention 1 \
	--hard-expiry
}

aws_iam_signin_link() {
    local alias="$1"

    aws iam delete-account-alias --account-alias $alias
    aws iam create-account-alias --account-alias $alias
}
