# Frappe-Dev
https://libfrappe.herokuapp.com/

## For easy browsing
https://github.dev/madhavparikh99/Frappe-Dev


## Prerequisite
- [Python 3.7+](https://www.python.org/downloads/)
- [PIP 20.0+](https://bootstrap.pypa.io/get-pip.py)

## Installation
**Creating a Virtual environment:**<br/>
We create virtual environment in order to create a seperate box in your local machine. Whenever you run you flask application locally it will work from inside the box and will 
not mess with the  exisiting system and dependencies of other python projects.

**Create a virtual environment:**
```
virtualenv venv
```

**Activate virtual environment:**
```
venv\script\activate
```

<b><i> Please activate the virtual environment before installing python dependecies. </b></i>

<b>Requirements.txt</b> will have all the python dependencies and libraries to run the python flask application

<b>Installing the python dependencies: </b>
```
pip install -r requirements.txt
```

## Run the Python Application ##
To run the application we will run the following command:
```
python app.py
```
This command will create a package and run your application.<br/>
To open it in a browser go to this URL:
For Librarian:
```
http://127.0.0.1:8000/
```
For User:
```
http://127.0.0.1:8000/user
```
# Screenshots
## Insert Books
![](/Documentation/SS/Insert_Books.png "Insert Books")
## View/Update Inventory
![](/Documentation/SS/Inventory.png "Insert Books")
## Add Members
![](/Documentation/SS/Members.png "Add Members")
## View/Update Members
![](/Documentation/SS/Members_Detailed.png "Add Members")
## Bookings
![](/Documentation/SS/Bookings.png "Bookings")
## Return Bookings
![](/Documentation/SS/Return_Bookings.png "Return Bookings")
## Settings
![](/Documentation/SS/Settings.png "Settings")
