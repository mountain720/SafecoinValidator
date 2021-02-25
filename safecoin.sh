#!/bin/bash
sudo apt-get update
sudo apt install git -y
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup component add rustfmt
sudo apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make -y
git clone https://github.com/Fair-Exchange/SAFE
cd SAFE
cargo build
sh -c "$(curl -sSfL https://release.solana.com/v1.5.10/install)"
export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"

safecoin config set --url https://api.mainnet.safecoin.org
sudo solana-sys-tuner --user $(whoami) > sys-tuner.log 2>&1 &
sudo sysctl -w vm.max_map_count=500000

#from here, multiple keypairs are created.  you'll need to do this manually for a real validator and make note of your key seed.  for a testnet validator, you don't have to

safecoin-keygen new -o ~/validator-keypair.json
safecoin config set --keypair ~/validator-keypair.json
safecoin-keygen new -o ~/vote-account-keypair.json
safecoin create-vote-account ~/vote-account-keypair.json ~/validator-keypair.json
safecoin airdrop 10

