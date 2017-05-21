loop-script
===========

this image will keep executing the script in env var LOOP_SCRIPT every INTERVAL_SECONDS seconds.

it is useful specially inside kubernetes running in a daemonset.

in the example @ vpn-fix-ds.yaml, it will keep checking is some iptables rule exists, and, if not, add it.
