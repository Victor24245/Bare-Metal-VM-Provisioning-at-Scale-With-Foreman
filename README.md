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
