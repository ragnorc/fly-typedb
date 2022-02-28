database: rm -f "/typedb-all-linux/server/data/lost+found" && ./typedb-all-linux/typedb server
worker: go-cron -s="@daily" -p=0 -- /bin/sh backup.sh
