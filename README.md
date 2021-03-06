# Bookmark Manager

## DB Setup

* From your project root folder run `psql -f db/migrations/01_create_db.sql`
* psql `\c bookmark_manager;`
* Run 02_create_bookmarks_table.sql
* Repeat the above instructions to create a bookmark_manager_test database using `psql -f db/migrations/01_create_db_test.sql`

*


## User Stories

```
As a user
So i can view my bookmarks
I would like to create a list
```
The above user story will use the following **elements**:
* controller
* bookmark class
* bookmark view



- When the user visits bookmarks via the '/bookmarks' path sends the request through to our bookmark manager (aka the controller)
- When the controller gets the request, it asks the `Bookmark` class to give it all the bookmarks, i.e. the controller asks for `Bookmark.all`.
- The `Bookmark` class goes and gets the bookmarks, and gives back all the bookmarks in an array to the controller.
- The controller renders the array of bookmarks to a webpage, which it sends as a response to the user


add new bookmarks
```
As a user
So i can add new bookmarks
I would like to be able to add a bookmark to my bookmark list
```

```
As a user
So I can delete bookmarks
I would like to be able to retract from the list
```

```
As a user
So i can see the most updated page/information
I would be able to update an existing bookmark
```

```
As a user
So I can summarise the page
I would like to be able to comment on bookmarks
```

```
As a user
So I can organise my bookmarks
I would like to be able to tag bookmarks into categories
```

```
As a user
So I can find a page
I would like to filter existing bookmarks by tag
```

```
As a user
So other people cannot change my bookmarks
I would like to restrict access to only myself
```
