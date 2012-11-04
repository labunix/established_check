established_check
=================

同時接続数のチェックスクリプト/バッチ

[for linux Script(bash)]

Usage		: ./established_check.sh [1-65535]
Description	: port [1-65535]
		: default port 8080

[for Windows batch]

Usage		: established_check.bat
Description	: port 8080
		: If you want to change port,
		: edit line
		: Set CHKPORT=8080

[Format]
		: CPEC = Check Port Established Count
		: APEC = All Port Established Count

yyyy/mm/dd,HH:MM:SS,[Port Number],[CPEC],[APEC]



