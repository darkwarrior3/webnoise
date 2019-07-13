RED="\e[1;31m]"
GREEN="\e[1;32m]"
BLUE="\e[1;34m]"
TEAL="\e[1;36m]"
declare -a sites=(www.yahoo.co.in, www.wikipedia.org) #Websites to request inside brackets
n=1
while true; do
    echo ""
    case ${n: -1} in
        1)
        [ $n -eq 11 ] && end=th || end=st;;
        2)
        [ $n -eq 12 ] && end=th || end=nd;;
        3)
        [ $n -eq 13 ] && end=th || end=rd;;
        *)
    end=th;;
esac
    echo ${n}${end} iteration
    for i in $(seq 1 $(tput cols));do printf -;done
    for i in $(cat hosts.txt); do
        echo Requesting $i
        pattern="^$i"
        curl -s $i > /dev/null
        [ $? -ne 0 ] && sed -i "/${pattern}/d" hosts.txt
        sleep 1
    done
    let n++
    sleep 60 
done
