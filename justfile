partio := justfile_directory()

[private]
default:
    @just --list --unsorted

# Build partio
[group("partio")]
build:
    @nom-build {{ partio }}/partio.nix --no-allow-import-from-derivation

# Create install ISO
[group("iso")]
create:
    @nom-build {{ partio }}/iso/default.nix -A config.system.build.isoImage --no-allow-import-from-derivation

# Run install ISO in a VM
[group("iso")]
ether:
    @qemu-system-x86_64 -cdrom result/iso/*.iso -boot d -m 4096

# Burn ISO into a disk
[group("iso")]
burn disk:
    @caligula burn result/iso/*.iso -o {{ disk }}
