#!/usr/bin/env sh
set -u

# Read-only OpenMANET/HaLowLink2 status probe.
# It is intentionally conservative: one nested SSH command at a time because
# the current Tailscale -> Surface -> HaLow relay has been flaky under parallel
# checks.

SURFACE_HOST="${SURFACE_HOST:-diamo@100.66.68.43}"
TL_HOST="${TL_HOST:-root@10.41.100.89}"

surface_ssh() {
	ssh -o BatchMode=yes -o ConnectTimeout=12 "$SURFACE_HOST" "$@"
}

tl_ssh() {
	surface_ssh ssh \
		-o BatchMode=yes \
		-o ConnectTimeout=20 \
		-o StrictHostKeyChecking=no \
		-o UserKnownHostsFile=NUL \
		"$TL_HOST" "$@"
}

section() {
	printf '\n== %s ==\n' "$1"
}

run_check() {
	label="$1"
	shift
	section "$label"
	if "$@"; then
		return 0
	fi
	status=$?
	printf 'CHECK_FAILED label=%s exit=%s\n' "$label" "$status" >&2
	return 0
}

run_check "surface hostname" surface_ssh hostname

run_check "tl tcp" surface_ssh powershell -NoProfile -Command \
	"Test-NetConnection -ComputerName ${TL_HOST#*@} -Port 80 -InformationLevel Quiet; Test-NetConnection -ComputerName ${TL_HOST#*@} -Port 22 -InformationLevel Quiet"

run_check "tl release" tl_ssh "cat /etc/openwrt_release"

run_check "tl ip" tl_ssh "ip -br addr"

run_check "tl batctl if" tl_ssh "batctl if"

run_check "tl batctl n" tl_ssh "batctl n"

run_check "tl services" tl_ssh "/etc/init.d/openmanetd status; /etc/init.d/alfred status"

run_check "tl bridge" tl_ssh "brctl show"
