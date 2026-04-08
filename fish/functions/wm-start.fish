function wm-start --description "Start yabai and skhd, reload yabairc"
    yabai --start-service
    skhd --start-service
    sh ~/.yabairc
    echo "yabai + skhd started"
end
