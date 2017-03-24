aws_org_account_make() {
    local email="$1"
    local alias="$2"
    local provider="$3"
    local role_path="$4"
    local policy_arn="${5:-arn:aws:iam::aws:policy/AdministratorAccess}"

    local dir=$(mktemp -d -t tmp.org)

    local role_name=$(basename $role_path)
    local role_parent=$(dirname $role_path)

#    local account_id=$(aws_org_account_create "$email" "$alias")
local account_id=$(_util_account_name_to_id "$alias")

    aws_org_run_as "$alias" "aws_iam_password_policy"
    aws_org_run_as "$alias" "aws_iam_signin_link $alias"
    #    aws_org_run_as "$alias" "sts_regions_disable.py --login $email"
    #    aws_org_run_as "$alias" "root_key_delete.py --login $email"
    #    aws_org_run_as "$alias" "root_mfa_enable.py --login $email"

    local subject="/C=US/ST=MD/L=Upper Marlboro/O=${AWS_ORG}/OU=Technology/CN=${account_id}"
    local saml_file=$(jc_app_create "$account_id" "2048" "1095" "${subject}" "${AWS_ORG}" "$role_path" "$provider" "$JC_EMAIL" "$dir")

    local trust_file="$dir/trust.json"
    aws_sts_iam_trust_write "$dir" "$trust_file" "$account_id" "$provider"

    aws_org_run_as "$alias" "aws_iam_idp_create file://$saml_file"
    aws_org_run_as "$alias" "aws_iam_role_create file://$trust_file /$role_parent/ $role_name $policy_arn"

    rm -rf $dir
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

    local account_id=$(aws --output text organizations list-accounts --query 'Accounts[].[Id, Name]' | awk -v k=$alias '$2 ~ k { print $1 }')

    echo $account_id
}

aws_org_account_wait_for() {
    local car="$1"

    [ -n "${DRY_RUN}" ] && return

    local i=1
    while [ : ]; do
	local status=$(aws --output text organizations describe-create-account-status --create-account-request-id $car --query "CreateAccountStatus.State")

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
