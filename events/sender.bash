pipe1=event_in_${RANDOM}
pipe2=event_in_${RANDOM}
pipe3=event_in_${RANDOM}
rm -f ${pipe1} && mkfifo ${pipe1}
rm -f ${pipe2} && mkfifo ${pipe2}
rm -f ${pipe3} && mkfifo ${pipe3}

trap 'cleanup' SIGINT
trap 'cleanup' SIGHUP
trap 'cleanup' ERR

cleanuptemps(){
    rm -f ${pipe1}
    rm -f ${pipe2}
    rm -f ${pipe3}
}
cleanuppids(){
    kill -9 ${pid1} 2>/dev/null >&2
    kill -9 ${pid2} 2>/dev/null >&2
    kill -9 ${pid3} 2>/dev/null >&2
}
cleanup(){
    cleanuptemps
    cleanuppids
}


./receiver1.bash 3<${pipe1} &
./receiver2.bash 3<${pipe2} &
./receiver3.bash 3<${pipe3} &

(while true ; do echo x ; sleep 1 ; done) >${pipe1} &
pid1=$!
(while true ; do echo y ; sleep 1 ; done) >${pipe2} &
pid2=$!
(while true ; do echo z ; sleep 1 ; done) >${pipe3} &
pid3=$!

wait ${pid1}
wait ${pid2}
wait ${pid3}

cleanuptemps

