function wm-stop --description "Stop yabai and skhd (e.g. when running Logic Pro)"
    yabai --stop-service
    skhd --stop-service
    echo "yabai + skhd stopped"
end
