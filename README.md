# Prophets CMS
The CMS has a public and private admin area with some simple login functionality.
In the Admin Area you can create Subjects/Pages/Sections.

Subjects are categories for pages in the navigation of the public area.
Pages provide the names for the links as well as the permalinks that can be visited. A page has a has_many relationship to sections.
Sections are snippets of content on a page that can be text or html.

There is a HABTM relation between AdminUser and Page that keeps track of the adminusers that manage pages.

As well as a HMT relation that is going to keep track of which AdminUsers edited which sections at which time and a summary of the changes made.

This application is built with: ruby 2.6.3p62

* Configuration

To get the application up and running you will need to create an AdminUser through terminal after which you can run the application. Creating content can then be done visiting the localhost:3000/admin where you should then be able to login with the user made earlier.

* Database creation

In development, just run `rake db:migrate` it'll create a SQLite3 db

* How to run the test suite

_work in progress_

* Services (job queues, cache servers, search engines, etc.)

_none yet_

* Deployment instructions
_work in progress_

* ...
