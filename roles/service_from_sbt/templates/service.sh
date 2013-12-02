#!/bin/bash
# chkconfig: 345 20 80
# processname: {{ service_name }}
#
# service {{ service_name }} start
# service {{ service_name }} stop
# service {{ service_name }} status
#

. /etc/rc.d/init.d/functions

export JAVA_HOME=/usr/java/jdk1.7.0_10

RUN_CMD={{ service_cmd }}

. /etc/init.d/functions
RETVAL=0
 
start() {
{% for port in service_ports %}
	daemon --user={{ service_user }} "{{ service_dest }}/bin/{{ service_subproject_name | lower }} {{ port }} -J\"{{ service_java_ops | join(' ') }}\" &"
{% endfor %}

	RETVAL=$?
 
	if [ $RETVAL -eq 0 ]; then
		echo_success
	else
		echo_failure
	fi
	echo
}
stop() {
	# SIGTERM service
	kill -15 `cat {{ service_dest }}/RUNNING_PID`

	RETVAL=$?
 
	if [ $RETVAL -eq 0 ]; then
		echo_success
	else
		echo_failure
	fi
	echo
}
status() {
        test -f {{ service_dest }}/RUNNING_PID
        RETVAL=$?
        if [ $RETVAL -eq 0 ]; then
                echo {{ service_name }} is running as pid `cat {{ service_dest }}/RUNNING_PID`
        else
                echo {{ service_name }} is not running
        fi
}
clean() {
        rm -f {{ service_dest }}/RUNNING_PID
}
case "$1" in
	start)
	clean
	start
	;;
	stop)
	stop
	;;
	restart|reload)
	stop
	sleep 10
	start
	;;
	status)
	status
	;;
	clean)
	clean
	;;
	*)
	echo "Usage: $0 {start|stop|restart|status}"
esac
exit 0
