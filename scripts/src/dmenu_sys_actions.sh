#!/bin/sh

reload() {
  case "$(echo -e "Window manager\nKeybindings" | dmenu_default \
        -p \
        "Reload:")" in 'Window manager') i3-msg restart && sleep 0.5 && \
        twmnc "Window manager reloaded" ;;
    'Keybindings') pkill -USR1 -x sxhkd && sleep 0.5 && \
        twmnc "Keybinds reloaded" ;;
  esac
}

monitor() {
  case "$(echo -e \
        "Dual-monitor\nSingle-monitor" |\
        dmenu_default \
        -p \
        "Monitor output:")" in 'Dual-monitor') dual_monitor;;
    'Single-monitor') single_monitor ;;
  esac
}

media() {
  case "$(echo -e \
        "Next track\nPrevious track\nPlay-pause" |\
        dmenu_default \
        -p \
        "Media:")" in 'Next track') playerctl -p spotify,mpd,Sonixd,sublimemusic next;;
    'Previous track') playerctl -p spotify,mpd,Sonixd,sublimemusic previous ;;
    'Play-pause') playerctl -p spotify,mpd,Sonixd,sublimemusic play-pause ;;
  esac
}

sound_ctl() {
  case "$(echo -e \
        "Toggle sink\nToggle source\nSwitch sink" |\
        dmenu_default \
        -p \
        "Sound control:")" in 'Toggle sink') pactl set-sink-mute @DEFAULT_SINK@ toggle;;
    'Toggle source') pactl set-source-mute @DEFAULT_SOURCE@ toggle ;;
    'Switch sink') dmenu_select_sink ;;
  esac
}

toggle_dnd() {
  num=$(pgrep twmnd | wc -l)
  if [[ $num -gt 0 ]]
  then
  	killall twmnd
  else
	twmnd &
  fi
}

case "$(echo -e \
    "DND\nMonitor\nPower\nSound\nMedia\nReload" |\
    dmenu_default \
    -p \
    "System actions:")" in Power) dmenu_power_menu;;
  Reload) reload ;;
  'Sound') sound_ctl ;;
  Monitor) monitor ;;
  Media) media ;;
  DND) toggle_dnd ;;
esac
