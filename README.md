Este script en Bash te permite obtener una reverse shell customizada con la ip y puerto que le indiques 


# Características: 
- Generación rápida de payloads de reverse shell
- Soporte para múltiples lenguajes
- Copiado automático en la clipboard
- Manejo de interrupciones con Ctrl+C
- Cuenta con un panel de ayuda:
<img width="1139" height="483" alt="image" src="https://github.com/user-attachments/assets/4eea2c50-26d4-4456-a7db-ff5652805210" />

# Lenguajes contemplados

![Python](https://skillicons.dev/icons?i=python)
![PHP](https://skillicons.dev/icons?i=php)
![Bash](https://skillicons.dev/icons?i=bash)
![Perl](https://skillicons.dev/icons?i=perl)
![Ruby](https://skillicons.dev/icons?i=ruby)
![BusyBox](https://skillicons.dev/icons?i=linux)
![JJS](https://skillicons.dev/icons?i=java)

# Instalación:
Clonamos el repositorio

```bash
  git clone https://github.com/avivyap/reverseShellGenerator
```

Le damos permisos de ejecución
```bash
  cd reverseShellGenerator
  chmod +100 reverse.sh
```
Ejecutamos el script

```bash
  ./reverse -l lenguaje -i ip_objetivo -p puerto
  ./reverse -l bash -i 192.168.1.1 -p 1212
```

# Output

Asi es como se representan las diferentes reverse shells dependiendo del lenguaje que elijas

<img width="1371" height="461" alt="image" src="https://github.com/user-attachments/assets/677722b8-1da6-4fae-8b15-f9c104d90878" />


