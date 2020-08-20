function ssh_chat() {

    NAME=$(echo "$*" | grep -o '[^ ]*@[^ ]*' | cut -d@ -f1)   # Getting user name.
    SERVER=$(echo "$*" | grep -o '[^ ]*@[^ ]*' | cut -d@ -f2) # Getting server name.

    mkfifo $SSHOME/$NAME                                 # Creating a FIFO tempfile.
    trap "rm $SSHOME/$NAME ; exit" SIGTERM SIGHUP SIGINT # Clearing the FIFO on kill.

    # Reading FIFO file in another thread.
    (cat -u -e $SSHOME/$NAME | while read line; do
        if echo "$line" | grep -q ''; then
            # python $SSHOME/notify.py $NAME $2 "$line"
            notify-send "New action"
        fi
    done & ) > /dev/null 2>&1 # Removing backgroung process info from output.

    ssh -t $* | tee $SSHOME/$NAME # Connecting to server and translating to FIFO.

    rm $SSHOME/$NAME # Kill the FIFO when done (should kill other threads).

    # killall cat # Stop reading file.
}

