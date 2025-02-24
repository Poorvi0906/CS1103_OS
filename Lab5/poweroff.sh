
shutdown_time="2025-02-24 15:45"
delta_seconds=$(( $(date -d "$shutdown_time" +%s) - $(date +%s) ))

if [ $delta_seconds -le 0 ]; then
    sudo shutdown -h now
else
    sudo shutdown -h +$((delta_seconds / 60))
fi


