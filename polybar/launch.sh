#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/mainbar.log
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload mainbar >>/tmp/mainbar.log 2>&1 &
done

echo "Bars launched..."
