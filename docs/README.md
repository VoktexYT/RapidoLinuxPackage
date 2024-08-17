
# Rapido package

The Rapido package is used to save/import project structure with only one command.

Creator : Voktex\
System : GNU/Linux Debian

---
---
---

### How to install package ?

```shell
    git clone "https://github.com/VoktexYT/RapidoLinuxPackage.git"

    cd RapidoLinuxPackage/

    ./build.sh
```

### How to use package ?

#### Rapido init
Alway make the init command (After the installation) : It's used to create storage folder in ~/.rapido/

```shell
    rapido --init
```

---
---
---

#### Rapido save
For example : If you have create simple html/css project structure. With code in file. (It's include)
```
myStruct/
    html/
        index.html
    css/
        style.css
```

You can save this struct in Rapido :
```
rapido --save <template name> <path>

=

rapido --save simple-html-css myStruct/ 
```

#### Rapido import
If you started a projet and you want to have a basic template. You can Import your saved templates.

```
rapido --import <template name> <path>

=

rapido --import simple-html-css .
```

This command make "simple-html-css" template in the actual directory ( path = . )

#### Rapido list
This command is used to get all template name in rapido storage.

```
rapido --list
```

#### Rapido help
This command is used to get all rapido commands. It's a brief resume of this README file.

```
rapido --help
```