#!/bin/bash

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
myhome="$(eval echo ~${SUDO_USER:-$USER})"
if ! grep -q 'pgrep -f "/usr/local/bin/logsession"' "$myhome/.bashrc"; then
	cat << 'EOF' >> $myhome/.bashrc

if pgrep -f "/usr/local/bin/logsession"; then
	echo "↑ PID"
	echo "Session is being logged -- clear is disabled."
    clear()
    {
		echo "Session is being logged -- clear is disabled."
		:
	}
fi
EOF
fi

install -m 755 $script_dir/logsession.sh /usr/local/bin/logsession
source "$myhome/.bashrc"

if [[ $? -ne 0 ]]; then
    echo "[***] Run with sudo."
fi
