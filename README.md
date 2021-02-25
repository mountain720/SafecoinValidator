# SafecoinValidator

Shell script to get a SafeCoin validator node going.  From an Ubuntu 20.04 command line, type:

git clone https://github.com/mountain720/SafecoinValidator

cd SafecoinValidator

chmod +x safecoin.sh

./safecoin.sh

# The above gets the dependencies installed.  You must reboot the machine now. Type these commands now to configure:

cd SafecoinValidator

solana config set --url https://api.mainnet.safecoin.org

sudo solana-sys-tuner --user $(whoami) > sys-tuner.log 2>&1 &

sudo sysctl -w vm.max_map_count=500000


# Now, you'll have to manually type or copy/paste these keygen commands in, as you're supposed to make a note of the key seed, and password here:

solana-keygen new -o ~/SafecoinValidator/validator-keypair.json

solana config set --keypair ~/SafecoinValidator/validator-keypair.json

solana-keygen new -o ~/SafecoinValidator/vote-account-keypair.json
