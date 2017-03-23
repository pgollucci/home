aws_iam_role_create() {
    local json="$1"
    local path="$2"
    local name="$3"
    local policy_arn="$4"

    aws iam create-role --path $path --role-name $name --assume-role-policy-document $json
    aws iam attach-role-policy --role-name $name --policy-arn $policy_arn
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
