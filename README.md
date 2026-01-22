Este script en Bash te permite obtener una reverse shell customizada con la ip y puerto que le indiques 


# Características: 
- Generación rápida de payloads de reverse shell
- Soporte para múltiples lenguajes
- Copiado automático en la clipboard
- Manejo de interrupciones con Ctrl+C
- Cuenta con un panel de ayuda:
<img width="1139" height="483" alt="image" src="https://github.com/user-attachments/assets/4eea2c50-26d4-4456-a7db-ff5652805210" />
#Instalación:
Clonamos el repositorio
  git clont https://github.com/avivyap/reverseShellGenerator
Le damos permisos de ejecución
  cd reverseShellGenerator
  chmod +100 reverse.sh
Ejecutamos el script
  ./reverse -l lenguaje -i ip_objetivo -p puerto
  ./reverse -l bash -i 192.168.1.1 -p 1212
