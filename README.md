# IaC4MC-DO

Infrastructure as Code for running a Minecraft server on a DigitalOcean droplet.

This is how I build my Minecraft server. It probably isn't the way you build yours, and that's OK.

I am assuming a modicum of Linux and shell knowledge. Support is available for USD$200/hr, paid in advance.

# Software Versions

- CentOS 10 Stream
- OpenTofu 1.8.8
- Python 3.12.11
- Ansible-core 2.18.8
- Ansible-lint 25.8.2
- OnePassword 8.10.75 (with CLI enabled)
- OnePassword Connect

# Environment variables

| `OP_VAULT` | Your OnePassword Vault ID |
| `ITEM` | The name of the OnePassword item containing your DigitalOcean Spaces Access Key (with the access key ID in the username field, and the secret access key in the password field ) |
| `OP_CONNECT_HOST` | The URL of the local OnePassword Connect server, probably `http://localhost:8080/` |
| `OP_CONNECT_TOKEN` | The OnePassword Connect token |
| `TF_VAR_op_connect_token` | Another copy of the OnePassword Connect token |

# TODO
- Explain bootstrap
- Explain backend.sh
- Explain OpenTofu locals that need to be changed
