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
    end=st;;
        2)
    end=nd;;
        3)
    end=rd;;
        *)
    3nd=th;;
esac
    echo ${n}${end} iteration
    for i in $(seq 1 $(tput cols));do printf -;done
    for i in ${sites[@]}; do
        echo Requesting $i
        curl --silent $i
        sleep 3
    done
    let n++
    sleep 10
done
