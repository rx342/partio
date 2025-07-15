partio := justfile_directory()

[private]
default:
    @just --list --unsorted

# Build partio
[group("utils")]
partio:
    @nix-build {{ partio }}/partio.nix --no-allow-import-from-derivation

# Build all wrapped packages
[group("utils")]
build:
    @nix-build {{ partio }}/packages/all-packages.nix --no-allow-import-from-derivation

# Create install ISO
[group("iso")]
create:
    @nix-build {{ partio }}/iso/default.nix -A config.system.build.isoImage --no-allow-import-from-derivation

# Run install ISO in a VM
[group("iso")]
ether num_cores="4" ram="4G":
    @qemu-system-x86_64 -cdrom result/iso/*.iso -enable-kvm -cpu host -boot d -m {{ ram }} -smp cores={{ num_cores }}

# Burn ISO into a disk
[group("iso")]
burn disk:
    @caligula burn result/iso/*.iso -o {{ disk }}
