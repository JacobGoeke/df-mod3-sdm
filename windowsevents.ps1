# Gets windows events and stores them in a log

Get-WinEvent -Listlog * > logs.txt -Force

mkdir logs -Force

move logs.txt logs -Force