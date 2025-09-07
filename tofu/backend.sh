export ITEM_ID=$(curl -s -H "Authorization: Bearer $TF_VAR_op_connect_token" "$OP_CONNECT_HOST/v1/vaults/$TF_VAR_vault/items" | jq -r --arg ITEM "$DO_SPACES_ITEM" '.[] | select(.title == $ITEM) | .id')

export ITEM=$(curl -s -H "Authorization: Bearer $TF_VAR_op_connect_token" "$OP_CONNECT_HOST/v1/vaults/$TF_VAR_vault/items/$ITEM_ID")

unset ITEM_ID

export AWS_ACCESS_KEY_ID=$(echo "$ITEM" | jq -r '.fields[] | select(.label == "username") | .value')
export AWS_SECRET_ACCESS_KEY=$(echo "$ITEM" | jq -r '.fields[] | select(.label == "password") | .value')

unset ITEM
