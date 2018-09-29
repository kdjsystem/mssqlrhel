oc delete project mssql
sleep 60
oc new-project mssql 
oadm policy add-scc-to-user anyuid -z default
oc new-app https://github.com/kdjsystem/mssqlrhel 
oc env "dc/mssqlrhel" -e ACCEPT_EULA=y -e SA_PASSWORD='zpdlelwpdl12!@'
oc volume "dc/mssqlrhel" --add --mount-path=/var/opt/mssql --type=persistentVolumeClaim --claim-name=mssqlrhel --claim-mode="ReadWriteOnce" --claim-size=1G
sleep 20
oc logs -f bc/mssqlrhel

