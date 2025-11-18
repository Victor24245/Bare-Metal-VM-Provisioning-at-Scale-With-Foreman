                   ┌────────────────────────────────────────┐
                   │                Foreman                  │
                   │  - Orchestration                       │
                   │  - Hostgroups                          │
                   │  - Kickstart Templates                 │
                   │  - Cloud-Init Templates                │
                   └───────────────┬────────────────────────┘
                                   │
        ┌──────────────────────────┼──────────────────────────────────┐
        │                          │                                  │
        ▼                          ▼                                  ▼
  Smart Proxy (TFTP)       Smart Proxy (DHCP)               Smart Proxy (DNS)
  - boots PXE clients      - provides IP leases             - provides hostnames
  - serves boot images     - points to Foreman              - integrates with DHCP
                            for Kickstart/Cloud-Init
        │
        ▼
 ┌──────────────────────────────┐
 │        KVM Hypervisors       │
 │  - libvirt networks          │
 │  - PXE-capable VMs           │
 │  - cloud-init VM templates   │
 └──────────────────────────────┘
        │
        ▼
  Provisioned VMs + Hosts
  - auto-registered in Foreman
  - auto-configured
  - ready for SSH






How to use.

sudo dnf install https://yum.theforeman.org/releases/latest/el8/x86_64/foreman-release.rpm
sudo dnf module enable ruby:3.1
sudo dnf module enable postgresql:14
sudo dnf install foreman-installer

sudo foreman-installer \
  --enable-foreman-proxy \
  --enable-foreman-proxy-dhcp \
  --enable-foreman-proxy-dns \
  --enable-foreman-proxy-tftp


sudo virsh net-define provision.xml
sudo virsh net-start provision
sudo virsh net-autostart provision




Add OS Templates

Upload:

Kickstart templates (Kickstart = rhel-ks.cfg)

Cloud-init templates (User Data = ubuntu-user-data.yaml)

Provisioning scripts
