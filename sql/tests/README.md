# Database Test Script
This directories main purpose is to run the test.py script which inserts sample data into each table within the database schema before deleting it.

## To run the script

For most platforms run:
```
./install.sh
python3 test.py
```

## For NixOS
```
nix-shell ../../shell.nix --pure --run 'python3 test.py'
```