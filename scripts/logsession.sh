#!/bin/bash

# Config
log_dir="$HOME/.logs"
time=$(date "+%Y-%m-%d_%H-%M")
filename="${time}.log"

# Usage
usage() {
  echo "Usage: $0 [-d log_directory] [-f filename]"
  echo "  -d  Set custom log directory"
  echo "  -f  Set custom filename"
  exit 1
}

while getopts ":d:f:" opt; do
  case $opt in
    d) log_dir="$OPTARG" ;;
    f) filename="$OPTARG" ;;
    *) usage ;;
  esac
done

log_path="${log_dir}/${filename}"

# Parse aguments
mkdir -p "$log_dir" || {
  echo "Error: Unable to create log directory $log_dir" >&2
  exit 1
}

# Some verbose stuff

echo "Terminal I/O logging to $log_path"
echo "Time: $(date)"

# exit
cleanup() {
	echo "[***] logsession has ended."
}

trap cleanup EXIT

script -q -f "$log_path"

if [[ $? -ne 0 ]]; then
	echo "[***] Run with sudo"
fi
