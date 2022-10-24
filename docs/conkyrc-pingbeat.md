# conkyrc-pingbeat

don't forget to change the keyword **HOSTNAME** by the IP address or the domain name you want to monitor.

On the file **conkyrc-pingbeat** :
```bash
${exec if ! $( ping -c1 HOSTNAME &>/dev/null ) ; then echo "Server Offline - `date`" ; else echo "Server Online - `date`" ; fi }
```
