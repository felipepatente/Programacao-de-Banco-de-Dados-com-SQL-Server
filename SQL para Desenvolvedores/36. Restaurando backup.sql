use master;

RESTORE DATABASE DesenvolvimentoIO
FROM DISK = '/var/opt/msslq/data/AulaBackup.bak'
WITH REPLACE