# randomBackgroundChanger

Changes PC wall paper as well as the background for firefox home page to a random imager form backgrounds directory

## Overview

There are two bash scripts here, rbchanger.sh and bbchanger.sh. rbchanger.sh is what will be called to randomly change the background, and bbchganger.sh is call within rbchanger.sh to change the background of the firefox display. This way, if you do not use firefox, you can either create a bbchanger for your browser, or ignore it and only use the random background changer. 

### bbchanger: browser background changer

You must be using a firefox browser. Step one to getting this script to work is to understand the userContent.css file withing the chrome directory. You will most likely need to create this file and directory within your firefox directory. To know exactly which directory to make this directory and file inside of, go the the Troubleshooting Information for firefox, and next to Profile directory, it will give you the directory path. Make these files, and in the userContent.css file, add the folowing:

  @-moz-document domain()
  {
    body {
      bakdground-image: url("backgrounds/ -imageName- .jpg") !important;
      background-position: center;
    }
  }

this will change the background of the domain "" (home page) to the background of whatever image you choose. How bbchanger works, is it changes the imageName to a random different name of an image in your background directory. The userContent.css file, however, does not have access to the files in your home directory, so you must have and exact copy of your directory with all your backgrounds in your chrome directory with this .css file. 

In the backgrounds directory, it is also important to have a file called holder.txt in a directory called tmp. This file will hold the name of the image currently being used. With this name, bbchanger executes a find and replace, to replace the current background text with a new image name. It also updates the holder.txt to the new image. Make sure your bbchanger is functional before implementing rbchanger.

### rbchanger: random background changer

You must be using a nitrogen system for this to work. you also need to make a directory backgrounds within your home directory that holds all the images you wish to be in your pool. This changer also works with a double monitor setup as long as you position your monitors one over the other. It does this by selecting two images instead of one if you have two monitors set up, and combining them into one. If you prefer to have your displays connected next to eachother, this is pretty easy to change in the code. This code does not work for a three monitor set up. Rember, if you are running bbchanger with this, you must have a tmp directory inside your backgrounds folder with a file called holder.txt containg the current image name. 
