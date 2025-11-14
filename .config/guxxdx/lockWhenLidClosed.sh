#!/bin/bash

lidState="/proc/acpi/button/lid/LID/state"
sleep 2

if grep -q closed "$lidState"; then
    hyprlock
fi

