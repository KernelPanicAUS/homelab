# DNS
This ansible playbook configures "DNS hosts" which receive all DNS queries in the network.

## Config
These hosts run AdGuardHome, which is configured to resolve queries in a privacy friendly way
and as a bonus, blocks queries for known advertising and malware addresses.  
Additionally, tailscale is installed on the nodes and they are added to the tailnet to be reachable via ssh form outside the network boundary.

### Pre-requisites
* nix (preferrably from [determinate systems](https://determinate.systems/posts/determinate-nix-installer))
* 1Password

### Provisioning the hosts
1. Make sure to check the configured hosts in the [inventory.yml](./inventory.yml) file.
2. Execute `nix develop` to enter the nix shell.
3. Execute `just run` to run ansible.