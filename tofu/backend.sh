op signin
export VAULT=ify2elut7a2h2sc5azlpscwbfq
export ITEM="DigitalOcean Spaces Access Key"
export AWS_ACCESS_KEY_ID=$(op read "op://$VAULT/$ITEM/username")
export AWS_SECRET_ACCESS_KEY=$(op read "op://$VAULT/$ITEM/password")
