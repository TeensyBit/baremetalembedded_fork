define connect
    target remote localhost:3333
    monitor reset init
end

define flashwrite
    if $argc != 1
        echo "Usage: flashwrite <filename>\n"
    else
        monitor flash write_image erase $arg0
    end
end