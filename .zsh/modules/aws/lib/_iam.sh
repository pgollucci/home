aws_iam_role_create() {
    local json="$1"
    local role_path="$2"
    local name="$3"
    local policy_arn="$4"

    aws iam detach-role-policy --role-name $name --policy-arn $policy_arn
    aws iam delete-role --role-name $name

    aws iam create-role --path $role_path --role-name $name --assume-role-policy-document $json
    aws iam attach-role-policy --role-name $name --policy-arn $policy_arn
}

aws_iam_idp_create() {
    local xml_path="$1"

    local name=$(basename $xml_path | cut -d'-' -f 3 | sed -e 's,.xml$,,')

    local saml_provider_arn=$(aws --output text iam list-saml-providers --query "SAMLProviderList[].Arn")

    aws iam delete-saml-provider --saml-provider-arn $saml_provider_arn
    aws iam create-saml-provider --saml-metadata-document $xml_path --name $name
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
