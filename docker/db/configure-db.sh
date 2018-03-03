#!/bin/bash

# wait for MSSQL server to start
export STATUS=1
i=0

echo docker.for.mac.localhost

while [[ $STATUS -ne 0 ]] && [[ $i -lt 30 ]]; do
	i=$i+1
	/opt/mssql-tools/bin/sqlcmd -t 1 -U sa -P $SA_PASSWORD -Q "select 1" >> /dev/null
	STATUS=$?
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than thirty seconds to start up."
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========" | tee -a ./config.log
# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'testuser123!' -d master -i setup.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'testuser123!' -d master -i data.sql

echo "======= MSSQL CONFIG COMPLETE =======" | tee -a ./config.log