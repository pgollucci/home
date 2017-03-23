aws_shortcuts_unset() {

    local func
    for func in $(typeset -f | awk '/^[a-z_0-9]+ \(\)/ { print $1 }' | grep awsa_); do
	unset $func
    done
}

aws_shortcuts_set() {

    local profile
    for profile in $(awk '/^\[/ { print }' < $AWS_CREDENTIAL_FILE | grep -v default | sed -e 's,[][],,g'); do
	local account=$(echo $profile | cut -d'-' -f 1)

	eval "awsa_${account}() { aws_shortcut_set \"$profile\" \"us-east-1\" \"env\" \"type\" }"
    done
}

aws_shortcut_set() {
    local profile="$1"
    local region="$2"
    local env="$3"
    local type="$4"

    aws_profile "$profile"
    aws_region "$region"
    aws_env "$env"
}
