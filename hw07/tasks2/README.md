# Tasks2

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Design Choices

 Users of my app are able to complete the core functionality as outlined in the hw06 design specs, such as:

    Register an account
    Log in / Log out
    Create Tasks, entering a title and a description
    Assign tasks to users they are managers of
    Track how long they've worked on a task they're assigned to, in multiple increments.
    Mark a task as completed.
    
I made the following app decisions:

    When creating a new task, I left the completed? toggle instead of auto-setting to false, in case the user would like to 
    log a task that has already been completed.

    I am viewing this app as something that a systems administrator might use personally, so I am okay with the user(s) seeing
    the /users /tasks /manages index pages, which I have linked to at the top (also for my convenience).
    
There are a large number of improvements that can be made:

    Clicking the Log in button without entering an email address could display a message to the user.
    Clicking the Log in button after entering an incorrect email address could alert the user.
    Creating an account could take the user directly to the feed, instead of the users index.
    In the feed, completed tasks could be moved to a separate section.
    When creating new tasks, inputting a non-existant user could display an error message instead of a server error.
    General GUI improvements all around.


