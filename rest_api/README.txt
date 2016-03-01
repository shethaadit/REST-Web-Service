index.php file queries this view to extract results.

/localhost/Rest_api/ displays information of all the books.

/localhost/Rest_api/<bookid> displays the book information for given book.

If invalid bookid is entered, then it error message is shown.

.htaccess file should go into Rest_api folder.

Then we need to use following GET format of the php:
e.g.- "/localhost/Rest_api/?bookid=1"

