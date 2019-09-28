# Windows Terminal Settings desktop application

## version 1

Main window will be split into two parts
- 1 row of buttons: load, save, exit
- main editing area

Application workflow:
- Initially only load button will be enabled, TextBox editing is disabled
- **Load button** action:
  - it will check if textbox is modified, if yes it will prompt if you want to abandon your changes, if yes set modified=false
  - if textbox is not modified or changes abandoned: load file, set modified=false, enable editing, disable both load and save buttons, status=Settings loaded
- **Save button**
  - verify if textbox contains proper json file if not popup 
  - save file
  - disable both load and save button, enable editing, status = Settings Saved, set modified to false
- Textbox **on Change**
  - modified=true
  - enable all buttons
  - Status = Settings modified
- **Exit button**
  - if Modified && (!Confirm popup) then nothing
  - else exit app

## Version 2

## Version 3

