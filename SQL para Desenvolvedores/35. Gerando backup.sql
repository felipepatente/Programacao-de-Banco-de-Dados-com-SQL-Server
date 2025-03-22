USE DesenvolvedorIO;

--backup completo
BACKUP DATABASE DesenvolvedorIO
TO DISK = '/var/opt/msslq/data/AulaBackup.bak'
WITH INIT,
NAME = 'Backup do banco de dados'

--backup diferencial
BACKUP DATABASE DesenvolvedorIO
TO DISK = '/var/opt/msslq/data/AulaBackup-01.bak'
WITH DIFFERENTIAL,
NAME = 'Backup do banco de dados - Diferencial'