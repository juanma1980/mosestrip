# mousestrip (KWin script)
Kwin script that displays a read strip around the mouse.
The main purpose is to help focusing on the zone of the screen where the pointer is located. This is an aid for improving attemption-related or color perception issues when working with a computer.

## Install

Clone the repo and install the content of src/ with kpackagetool

```
cd /tmp
git clone https://github.com/juanma1980/mousestrip/
cd mousestrip
kpackagetool5 --install src/
````

## Configure

Configuration options are available at systemsettings->window management->kwin scripts.

Available options:

* Strip height: Amount of lines for the strip, from 1 to 5. Each line is 48px.
* Strip color: Color for the strip. **Light colors could have a big decrease in readability**
* Strip opacity: Adjustable from 0 (transparent) to 50. **High values could decrease readability**
* Border height: Height of the border around the strip
* Border color: ...
* Border opacity: Adjustable from 0 (transparent) to 100 (opaque)
* Fill screen: If this option is enabled then the border will fill all the screen around the strip.

## ToDo

* Add hotkey
* Apply changes
  
## Screenshots

![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/5cf118dd-b68a-47ae-9ad0-c70efd647b09)

![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/9b832ac2-08e8-40e8-bee2-fd24c4f9aea0)

![imatge](https://github.com/juanma1980/mousestrip/assets/15210634/15ed19c6-890f-4120-96a7-25355b88339d)

