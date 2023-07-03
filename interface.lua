function conky_get_interface_name()
    local file = io.popen("cat /sys/class/net/enp2s0/operstate 2>/dev/null | grep -q 'up' && echo 'enp2s0' || echo 'wlp3s0'")
    local interface = file:read("*a"):gsub("%s+", "")
    file:close()
    return interface
end