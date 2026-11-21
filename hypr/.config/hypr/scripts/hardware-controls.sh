#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C

# Feedback is optional: adjusting the hardware must not depend on notifications.
notify() {
    local title=$1 value=$2
    local icon progress
    case "$title" in
        Volume) icon=audio-volume-high-symbolic ;;
        Microphone) icon=microphone-sensitivity-high-symbolic ;;
        Brightness) icon=display-brightness-symbolic ;;
    esac
    if [[ $3 == Muted ]]; then
        if [[ $title == Microphone ]]; then
            icon=microphone-sensitivity-muted-symbolic
        else
            icon=audio-volume-muted-symbolic
        fi
    fi
    if command -v swayosd-client >/dev/null && pgrep -x swayosd-server >/dev/null; then
        progress=$(awk -v value="$value" 'BEGIN { printf "%.2f", (value > 100 ? 100 : value) / 100 }')
        if swayosd-client --custom-icon "$icon" --custom-progress "$progress" \
            --custom-progress-text "$3"; then
            return 0
        fi
    fi
    command -v notify-send >/dev/null || return 0
    notify-send -a hypr-controls -t 1500 \
        -h "string:x-canonical-private-synchronous:$title" \
        -h "int:value:$value" "$title" "$3" || true
}

case "${1:-}" in
    volume-up|volume-down|volume-mute|mic-mute)
        device=sink
        target=@DEFAULT_SINK@
        title=Volume
        case "$1" in
            volume-up)
                volume=$(pactl get-sink-volume "$target")
                # Use the loudest channel so neither channel exceeds 100%.
                value=$(awk '{
                    for (i = 1; i <= NF; i++)
                        if ($i ~ /^[0-9]+%$/ && $i + 0 > max)
                            max = $i + 0
                } END { print max + 0 }' <<< "$volume")
                if (( value >= 95 )); then
                    pactl set-sink-volume "$target" 100%
                else
                    pactl set-sink-volume "$target" +5%
                fi
                ;;
            volume-down) pactl set-sink-volume "$target" -5% ;;
            volume-mute) pactl set-sink-mute "$target" toggle ;;
            mic-mute)
                device=source
                target=@DEFAULT_SOURCE@
                title=Microphone
                pactl set-source-mute "$target" toggle
                ;;
        esac
        if [[ $(pactl "get-$device-mute" "$target") == 'Mute: yes' ]]; then
            notify "$title" 0 Muted
        else
            volume=$(pactl "get-$device-volume" "$target")
            if [[ $volume =~ ([0-9]+)% ]]; then
                value=${BASH_REMATCH[1]}
                notify "$title" "$value" "$value%"
            fi
        fi
        ;;
    brightness-up|brightness-down)
        step=+5%
        [[ $1 == brightness-down ]] && step=5%-
        brightnessctl -q -n 1 set "$step"
        current=$(brightnessctl get)
        maximum=$(brightnessctl max)
        value=$((100 * current / maximum))
        notify Brightness "$value" "$value%"
        ;;
    *) printf 'Usage: %s {volume-up|volume-down|volume-mute|mic-mute|brightness-up|brightness-down}\n' "$0" >&2; exit 2 ;;
esac
