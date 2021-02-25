#!/bin/bash
sudo apt-get update
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup component add rustfmt
sudo apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make -y
git clone https://github.com/Fair-Exchange/SAFE
cd SAFE
cargo build
sh -c "$(curl -sSfL https://release.solana.com/v1.5.10/install)"
export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"

