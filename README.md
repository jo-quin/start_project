# Start_project

This little app helps you to quickly set up a Ruby working directory with Rspec, Rubocop and SimpleCov and initialize a local git repository anywhere in your terminal with just a single command.


# Motivation

While studying at Makers I found myself constantly typing the same commands in the terminal over and over again just to set up a working directory.  

Until I had the idea of automating this process :)


# How to use?

In order to run this app from anywhere in your terminal there is some set up that you will have to do.  
* Create a folder for your own libraries if you don’t have one. This is just a folder where you will store handy little apps that you can use in your own projects. Create this folder wherever you want! Mine is on the Desktop.  

   ```mkdir desktop/my_libraries```

* Add the folder to the [PATH](http://osxdaily.com/2014/08/14/add-new-path-to-path-command-line/). By adding the folder to the PATH you will be able to access its content from anywhere in the terminal. There are different ways to do this. This is one way to do it:  
  * On your terminal type `cd ~/` to go to your home folder.  

  * Open .bash_profile to edit it. You could use any text or source code editor. We will use atom:  

     ```atom .bash_profile```  

  * Inside you .bash_profile look for a line that starts with `export PATH=:$PATH:...`.  

  * Add your new library folder path to the PATH by adding a `:` followed by the path at the end of the line.  

     ```export PATH=:$PATH:(a few different paths here):/Users/jo-quin/desktop/my_libraries```  

* Now create an empty file inside you library folder called start_project:  

   ```touch start_project```  

* Copy the content of start_project.rb in to your new file.  

* Find out where is your Ruby installed by typing the following anywhere in your terminal:  

  ```which ruby```  

* Copy the output of ```which ruby``` and amend the [shebang]() on your start_project file. Remember to add ``#!`` at the beginning!  

That’s it!!! Easy right?!   

Now you should be able to setup a simple Ruby working directory for your new project anywhere in the terminal by typing `start_project name_of_your_project`.
