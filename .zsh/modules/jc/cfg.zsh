__setup() {

    export JC_EMAIL=pgollucci@p6m7g8.com

    path_if "${___dir}/bin"
}

jc_app_create() {
    local org="$1"
    local account_id="$2"
    local cert_subject="$3"
    local cert_bits="$4"
    local cert_exp="$5"
    local saml_provider="$6"
    local saml_provider_email="$7"
    local role_full_path="$8"

    local app="aws"

    local dir=$(transient_create "tmp.jc")

    local key_file="$dir/${account_id}.key"
    openssl_genrsa  "$key_file" "$cert_bits"

    local crt_file="$dir/${account_id}.crt"
    openssl_req_509 "$key_file" "$crt_file" "$cert_exp" "$cert_subject"

    local $saml_file=$(jc_app.py --key $key_file --crt $crt_file --org $org --account_id $account_id --role_path $role_full_path --provider $saml_provider --login $saml_provider_email)

    local dst_saml_file=$dir/${account_id}-${app}-${saml_provider}.xml
    mv_file "$saml_file" "$dst_saml_file"

    echo $dst_saml_file
}

__setup
