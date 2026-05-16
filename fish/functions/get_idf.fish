function get_idf --description "Activate ESP-IDF in the current shell (sources ~/Developer/esp-idf/export.fish)"
    if not test -f ~/Developer/esp-idf/export.fish
        echo "ESP-IDF not found at ~/Developer/esp-idf. Install with:"
        echo "  cd ~/Developer"
        echo "  git clone -b v5.3 --recursive https://github.com/espressif/esp-idf.git"
        echo "  cd esp-idf; and ./install.sh esp32"
        return 1
    end
    source ~/Developer/esp-idf/export.fish
end
