#!/bin/bash
# Change user passwords automatically

USERS=("user1" "user2" "user3")

gen_pass() {
  tr -dc A-Za-z0-9 < /dev/urandom | head -c 12
}

for u in "${USERS[@]}"; do
  if id "$u" &>/dev/null; then
    NEWPASS=$(gen_pass)
    echo "$u:$NEWPASS" | sudo chpasswd
    echo "[+] Password changed for $u -> $NEWPASS"
  else
    echo "[-] User $u does not exist"
  fi
done
