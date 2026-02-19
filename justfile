partio := justfile_directory()

[private]
default:
    @just --list --unsorted

# Build partio
[group("utils")]
partio:
    @nix-build {{ partio }} -A partio --no-allow-import-from-derivation

# Build package
[group("utils")]
build package:
    @nix-build {{ partio }}/packages/all-packages.nix -A {{ package }} --no-allow-import-from-derivation

# Build all wrapped packages
[group("utils")]
build-all:
    @nix-build --expr 'builtins.attrValues (import {{ partio }}/packages/all-packages.nix {})' --no-allow-import-from-derivation

# Clean repository
[group("utils")]
clean:
    @rm -rf result*

# Create install ISO
[group("iso")]
create host="minimal":
    @nix-build {{ partio }}/iso/default.nix -A {{ host }}.config.system.build.isoImage --no-allow-import-from-derivation

# Run install ISO in a VM
[group("iso")]
ether iso="result/iso/*.iso" num_cores="4" ram="4G":
    #!/usr/bin/env nix-shell
    #!nix-shell {{ partio }}/shell.nix -i bash

    qemu-system-x86_64 -cdrom {{ iso }} -enable-kvm -cpu host -boot d -m {{ ram }} -smp cores={{ num_cores }}

# Burn ISO into a disk
[group("iso")]
burn disk iso="result/iso/*.iso":
    #!/usr/bin/env nix-shell
    #!nix-shell {{ partio }}/shell.nix -i bash

    caligula burn {{ iso }} -o {{ disk }}
