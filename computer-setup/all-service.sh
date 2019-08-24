#!/bin/bash
#service.sh
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)

START_STOP=$1

declare -a services=("elasticsearch"
                     "cassandra"
		     "zookeeper"
		     "kafka"
		     "kibana"
		     "redis-server"
		     "mongod"
		     "memcached"
		     "neo4j"
		     )

SIZE=${#services[@]}
SIZE=$(( $SIZE - 1 ))

each=

for i in "${!services[@]}"
do
	each=$i
	if [ "stop" == "${START_STOP}" ]
	then
		each=$(( $SIZE - $i ))
	fi

	if (( $(ps -ef | grep -v grep | grep ${services[each]} | wc -l) > 0 ))
	then
		if [ "stop" == "${START_STOP}" ]
		then
			sudo systemctl stop ${services[each]}

			# wait service to be stop
			echo "${GREEN}Waiting for ${services[each]} to stop:"
			while (( $(ps -ef | grep -v grep | grep ${services[each]} | wc -l) > 0 ))
			do
				sleep 0.5
			done
			
			echo "${RED}${services[each]} is Stoped!!!"
		else
			echo "${GREEN}${services[each]} is running!!!"
		fi
	else 

		if [ "start" == "${START_STOP}" ]
		then
			sudo systemctl start ${services[each]}

			# check service started successfully

			echo "${GREEN}${services[each]} started!!!"
		else
			echo "${RED}${services[each]} is not running???"
		fi
	fi
done
echo "$(tput setaf 7)----"
