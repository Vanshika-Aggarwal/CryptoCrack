#!/bin/bash
sudo apt-get install -y expect
pip3 install pyfinite
python3 plaintext.py
echo "========= Sending plaintext for encryption ========="
./shell.sh > Data/output.log
echo "========== Formatting the received output =========="
python3 outclean.py
python3 arrange_out.py
echo "=========Sending plaintext for encryption========="
python3 diag.py