aws_iam_role_saml_create() {
    local role_full_path="$1"
    local account_id="$2"
    local provider="$3"

    local assume_role_policy_document=$(aws_iam_policy_saml_write "$account_id" "$provider")
    aws_iam_role_create "$role_full_path" "$assume_role_policy_document"
}

aws_iam_role_create() {
    local role_full_path="$1"
    local assume_role_policy_document="$2"

    local role_path=$(uri_parse_path "$role_full_path")
    local role_name=$(uri_parse_name "$role_full_path")

    _aws_iam_role_create "$role_path/" "$role_name" "$assume_role_policy_document"
}

_aws_iam_role_create() {
    local role_path="$1"
    local role_name="$2"
    local assume_role_policy_document="$3"

    aws --output text iam create-role --path $role_path --role-name $role_name --assume-role-policy-document $assume_role_policy_document --query "Role.Arn"
}

aws_iam_idp_create() {
    local xml_path="$1"
    local xml_name="$2"

    aws iam create-saml-provider --saml-metadata-document $xml_path --name $xml_name
}

aws_iam_password_policy_default() {

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
    local account_alias="$1"

    aws iam create-account-alias --account-alias $account_alias
}

aws_iam_policy_to_role() {
    local role_full_path="$1"
    local policy_arn="$2"

    local role_name=$(uri_parse_name "$role_full_path")

    aws iam attach-role-policy --role-name $role_name --policy-arn $policy_arn
}

aws_iam_policy_create() {
    local policy_full_path="$1"
    local policy_description="$2"
    local policy_document="$3"

    local policy_path=$(uri_parse_path "$policy_full_path")
    local policy_name=$(uri_parse_name "$policy_full_path")

    aws --output text iam create-policy --path $policy_path/ --policy-name $policy_name --description $policy_description --policy-document $policy_document --query "Policy.Arn"
}

aws_iam_template_process() { # GLOBAL
    local rel_path="$1"
    shift 1

    local token_args=$(token_args_from_list "" "," " " "$@")

    local dir=$(transient_create "aws.tmpl")
    local outfile="$dir/outfile"
    local infile="$HOME/.zsh/modules/aws/json/${rel_path}.json"
    template_fill_in "$infile" "$outfile" "" "$token_args"

    cat $outfile

    transient_delete "$outfile"
}

aws_iam_policy_service_write() {
    local service="$1"

    aws_iam_template_process "iam/service" \
			     "SERVICE=$service"
}

aws_iam_policy_cloudtrail_write() {
    local resource="$1"

    aws_iam_template_process "iam/cloudtrail" \
			     "RESOURCE=$resource"
}

aws_iam_policy_s3_cloudtrail_write() {
    local trail_bucket="$1"
    local account_id="$2"

    aws_iam_template_process "iam/s3_cloudtrail" \
			     "TRAIL_BUCKET=$trail_bucket" \
			     "ACCOUNT_ID=$account_id"
}

aws_iam_policy_saml_write() {
    local account_id="$1"
    local provider="$2"

    aws_iam_template_process "iam/saml" \
			     "ACCOUNT_ID=$account_id" \
			     "PROVIDER=$provider"
}
