_util_account_id_to_name() {
    local account_id="$1"

    _util_json_key_2_value "${account_id}" "$AWS_ACCOUNT_MAP"
}

_util_account_name_to_id() {
    local account_name="$1"

    _util_json_value_2_key "${account_name}" "$AWS_ACCOUNT_MAP"
}

_util_json_key_2_value() {
    local key="$1"
    local file="$2"

    awk -v k=$key '$1 ~ k { print $2 }' < $file | sed -e 's/[",:]//g' | head -1
}

_util_json_value_2_key() {
    local key="$1"
    local file="$2"

    awk -v k=$key '$2 ~ k { print $1 }' < $file | sed -e 's/[",:]//g'
}

_util_nicks() {
    local org="$1"

    awk -v k=$1 '$2 ~ k { print $2 }' < $AWS_ACCOUNT_MAP | sed -e 's,["],,g' | xargs | sed -e 's, ,,g' -e "s,$org,aws-$org,g"
}
