#!/bin/bash
echo $(sensors | grep Tdie | awk '{print $2}' |	sed -e 's/+//g')
