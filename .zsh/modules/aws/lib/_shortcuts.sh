aws_shortcuts_unset() {

    local func
    for func in $(typeset -f | awk '/^[a-z_0-9]+ \(\)/ { print $1 }' | grep awsa_); do
	unset $func
    done
}

aws_shortcuts_set() {
    local cred_file="$1"

    local profile
    for profile in $(awk '/^\[/ { print }' < $cred_file | grep -v default | sed -e 's,[][],,g'); do
	local region=$(aws_util_region_for_profile_from_cred_file "$profile" "$cred_file")

	eval "awsa_${profile}() { aws_shortcut_set \"$profile\" \"$region\" \"env\" \"type\" }"
    done
}

aws_shortcut_set() {
    local profile="$1"
    local region="$2"
    local env="$3"
    local type="$4"

    aws_cfg_set "$profile" "$region" "$env" "vpc" "env_level" "$type"
}

aws_shortcuts() {

    aws_shortcuts_unset
    aws_shortcuts_set "$AWS_CREDENTIAL_FILE"
}
