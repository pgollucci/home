openssl_req_509() {
    local key_file="$1"
    local crt_file="$2"
    local cert_exp="$3"
    local cert_subject="$4"

    openssl req -new -x509 -key $key_file -out $crt_file -days $cert_days -subj $cert_subject
}

openssl_genrsa() {
    local key_file="$1"
    local cert_bits="$2"

    openssl genrsa -out $key_file $cert_bits
}

__setup() {

    alias sha1="openssl dgst -sha1"
    alias sha2="openssl dgst -sha256"
    alias b64="openssl enc -base64"
}

__setup
