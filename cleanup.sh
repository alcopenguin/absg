#!/bin/bash
#cleanup ver 0.2
#root needed

LOG_DIR=/var/log
ROOT_UID=0	
LINES=50	#количество сохраняемых строк
E_XCD=66	#невозможно сменить каталог
E_NOTROOT=67	#пользователь не root

if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Для работы сценария требуются права root"
    exit $E_NOTROOT
fi

if [ -n "$1" ] #проверка наличия аргументов командной строки
then 
    lines=$1
else
    lines=$LINES # Значение по умолчанию, если новое значение не задано при вызове скрипта
fi

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ] 
then
    echo "Невозможно перейти в каталог $LOG_DIR"
    exit $E_XCD
fi #проверка каталога перед очисткой логов

tail -$LINES messages > mesg.temp #сохранение последних строк во временном логе
mv mesg.temp messages
cat /dev/null > wtmp 

echo "Логи очищены"
exit 0 #Возвращаемое значение 0 указывает на успешное завершение работы сценария 
