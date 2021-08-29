# jorge_zaragoza_challenge

# README.MD
Given a list of contact names (List<String>), render an address book list where the names are grouped by their first character.

## Content
This proyect has only one branch: master. **master** contains the full project.

## Demo
If you want to see the demo of this proyect, you can visit [Demo of the proyect](https://drive.google.com/file/d/1NojrACRZC2XJQJ3pfZgqEUO3rPcb7c4Y/view?usp=sharing)

## How to clone
* On GitHub AE, navigate to the main page of the repository.
* Above the list of files, click  Code.
* To clone the repository using HTTPS, under "Clone with HTTPS", click . To clone the repository using an SSH key, including a certificate issued by your organization's SSH certificate authority, click Use SSH, then click . To clone a repository using GitHub CLI, click Use GitHub CLI, then click .
* Open Git Bash.
* Change the current working directory to the location where you want the cloned directory.
* Type git clone, and then paste the URL you copied earlier.

## Installation
To install and run this proyect just type and execute
```bash
dart pub get
```
```bash
flutter run
```
  
  
## Preview

![](/preview1.PNG)
![](/preview2.PNG)
![](/preview3.PNG)

### Questions
  ¿Why a "scroll to index" behavior is not as straightforward?
  I think a "scroll to index" behavior is not that straightforward because some widgets like ListView only represent items that users can see, for example, the app will crash if
  you want to scroll to index 40 when we only show 4 items on the screen. . . On the other hand, if we use a SingleScrollView, all the elements will be rendered and the
  application optimization will collapse.
  
  Approach taken to solve the challenge and the architecture of the app:


