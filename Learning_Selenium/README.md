# ~ Learning Selenium with Java ~

### Description
I love learning new things but I can't help forgetting some. This is why I do this short summaries in a 'cheatsheet' like manner, to be able to keep all important details in one place. 

**NOTE**

While learning about Selenium, I have found "Selenium WebDriver with Java - Basics to Advanced" Course on Udemy to be very useful. [Check it out](https://www.udemy.com/selenium-real-time-examplesinterview-questions/learn/v4/overview)!

# README Contents 

| #   | Name                              | About 			               | Link                                    |
| --- | --------------------------------- | ------------------------------------------ | -------------------------------------------- |
| 1   | Debian Install 	                  | Installation Guide for Debian     	       | [Install Guide](#debian-install) 	       |
| 2   | Quick Start 	                  | Starts a chrome windows and gets the title | [Quick Start](#quick-start-for-chromedriver) 	       |
| 3   | Xpath + CSS (with/out RegEx) 	  | Write and read XPath, CSS	       	       | [Xpath and CSS](#xpath-and-css) 	       |
| 4   | Absolute/ relative paths 	  | sibling, parent, /selector...	       | [Paths](#absolute-relative-paths) 	       |
| 5   | Static/Dynamic Dropdowns 	  | selectby..., automatisation		       | [Dropdowns](#Dropdowns) 	       |


## Debian Install
- I have found the following steps [here](https://gist.github.com/ziadoz/3e8ab7e944d02fe872c3454d17af31a5)

**Steps:**
- insert the following code into a .sh file (using an editor of your choice), change its permission so that the file cand be run and simply ./ it with sudo.

```
#!/usr/bin/env bash
# https://developers.supportbee.com/blog/setting-up-cucumber-to-run-with-Chrome-on-Linux/
# https://gist.github.com/curtismcmullan/7be1a8c1c841a9d8db2c
# http://stackoverflow.com/questions/10792403/how-do-i-get-chrome-working-with-selenium-using-php-webdriver
# http://stackoverflow.com/questions/26133486/how-to-specify-binary-path-for-remote-chromedriver-in-codeception
# http://stackoverflow.com/questions/40262682/how-to-run-selenium-3-x-with-chrome-driver-through-terminal
# http://askubuntu.com/questions/760085/how-do-you-install-google-chrome-on-ubuntu-16-04

# Versions
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
SELENIUM_STANDALONE_VERSION=3.4.0
SELENIUM_SUBDIR=$(echo "$SELENIUM_STANDALONE_VERSION" | cut -d"." -f-2)

# Remove existing downloads and binaries so we can start from scratch.
sudo apt-get remove google-chrome-stable
rm ~/selenium-server-standalone-*.jar
rm ~/chromedriver_linux64.zip
sudo rm /usr/local/bin/chromedriver
sudo rm /usr/local/bin/selenium-server-standalone.jar

# Install dependencies.
sudo apt-get update
sudo apt-get install -y unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4

# Install Chrome.
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

# Install ChromeDriver.
wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
unzip ~/chromedriver_linux64.zip -d ~/
rm ~/chromedriver_linux64.zip
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver

# Install Selenium.
wget -N http://selenium-release.storage.googleapis.com/$SELENIUM_SUBDIR/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar -P ~/
sudo mv -f ~/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar /usr/local/bin/selenium-server-standalone.jar
sudo chown root:root /usr/local/bin/selenium-server-standalone.jar
sudo chmod 0755 /usr/local/bin/selenium-server-standalone.jar
```

**Notes**
- chromedriver is here: '/usr/local/bin/chromedriver'
- selenium files are here: '/usr/local/bin/selenium-server-standalone.jar'

## Quick Start For chromedriver
- in the chosen java IDE (ex. eclipse, NetBeans, etc. ) do:
	- create a new project
	- create a new class
	- click on Project->Properties->Java Build Path->Libraries->Add External JARs and select the file at '/usr/local/bin/selenium-server-standalone.jar'
	- insert the following code in the created class 

```
package <package_name>;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;


public class <class_name>{

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//selenium code		

		System.setProperty("webdriver.chrome.driver", "/usr/local/bin/chromedriver"); //
		ChromeOptions options = new ChromeOptions();
//		options.addArguments("--no-sandbox");//if error -> uncomment this (bug workaround)
		
		// ChromeDriver
		WebDriver driver = new ChromeDriver(options);
		driver.get("http://google.com");

		// Write testing code here:

		driver.close();// closes current window
		//or
		//driver.quit();//closes all chrome windows opened by selenium

	}
```
**Notes**
- change <package_name> and <class_name> to match your name of the project and your name of the class respectively

## Xpath and CSS

**XPath**

Syntax:
```
"//tagName[@attribute='value']"
"//tagName[@contains(@attribute,'value')]" //Regular Expression 
```
- to check if XPath for the element is ok, use the JavaScript console ( CTRL+Shift+C -> Console) and write the following:
```
$x("<XPath>")
```

**CSS**

Syntax:
```
"tagname[attribute='value']"
"tagName[Attribute*='value']"// RegEx
"#id" //works for ids
".class" //works for classes NOTE that "." replaces " " in class names
```

## Absolute/Relative paths

**Relative**
- depends on the position and existence of a chosen element

Syntax (XPath):
```
"//tagName[@attribute='value']/following-sibling::selector" //for a relative sibling
"//tagName[@attribute='value']/parent::selector" // used to grab the parent
"//tagName[@attribute='value']/selector" // used to grab a child of the chosen element
```

**Absolute**
- doesn't depend on the position and existence of other elements


## Dropdowns
-there are:
	- static dropdowns
	- dynamic dropdowns
Syntax:
```
import org.openqa.selenium.support.ui.Select;
Select s = new Select(<webdriver_element>); //webdriver element can be found by id, class, xpath, css selector etc.
					    // s will be the dropdown object with certain methods(selectby...) 
```
