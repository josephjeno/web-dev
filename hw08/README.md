# Tasks3

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Design Choices

 Users of my app are able to complete the core functionality as outlined in the hw08 design specs, such as:

    Register an account
    Log in / Log out
    Create Tasks, entering a title and a description
    Assign tasks to themselves or other users
    Track how long they've worked on a task they're assigned to, in 15-minute increments.
    Mark a task as completed.
    
I made the following app decisions:

    I decided to route the user back to the login page after logging in, as ideally there would be a message greeting the 
    user with stats on current tasks. 

    When creating a new task, I left the completed? toggle instead of auto-setting to false, in case the user would like to 
    log a task that has already been completed.
    
There are a large number of improvements that can be made:

    Clicking the Log in button without entering an email address could display a message to the user.
    Clicking the Log in button after entering an incorrect email address could alert the user.
    Logging in successfully could take the user to the feed, instead of the Log In/index page.
    In the feed, completed tasks could be moved to a separate section.
    General GUI improvements all around.
