Specifications for the Sinatra Assessment
Specs:

 X  Use Sinatra to build the app
 X  Use ActiveRecord for storing information in a database
 X  Include more than one model class (e.g. User, Post, Category) *user, show*
 X  Include at least one has_many relationship on your User model (e.g. User has_many Posts) *user has_many shows*
 X  Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) *show belongs_to user*
 X  Include user accounts with unique login attribute (username or email) *email*
 X  Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying *done*
 X  Ensure that users can't modify content created by other users *done - has redirect_if_not_logged_in and logged_in? helper methods in the controller*
 X  Include user input validations *authenticates password and requires title for any show created*
 X  BONUS - not required - Display validation failures to user with error message (example     form URL e.g. /posts/new) *sinatra-flash gem added and multiple confirmation and error messages display for various route functions*
 X  Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code *done*
Confirm

 X  You have a large number of small Git commits *done*
 X  Your commit messages are meaningful *done*
 X  You made the changes in a commit that relate to the commit message *done - there are a few that were multiple changes*
 X  You don't include changes in a commit that aren't related to the commit message *mostly!*