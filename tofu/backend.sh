op signin
export ITEM="DigitalOcean Spaces Access Key"
export AWS_ACCESS_KEY_ID=$(op read "op://$OP_VAULT/$ITEM/username")
export AWS_SECRET_ACCESS_KEY=$(op read "op://$OP_VAULT/$ITEM/password")
