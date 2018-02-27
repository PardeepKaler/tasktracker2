# Tasktracker

Assumptions:
1) While registering, user can sign in as admin or not.
2) Only admin can assign managers to other users/himself. Admin can assign managers after clicking "Assign Managers To Users" button when he is logged in.
3) Only Managers who have underlings can create new task.
4) Task can be assigned to user only by his manager.
5) On tasks page, user can see the tasks assigned to him if any.
6) He can also see his manager and underlings on tasks page.
7) He can click on task report to see the tasks assigned to his underlings if any.
8) In tasks page, in front of every task, there is a start working/ stop working button , clicking on which user can edit the timeblocks for that tasks.
9) User can also manually add the timeblock or can edit the time blocks. To do so, he can click the "Edit TimeBlock button".
10) To edit the task, user can click on the edit button in front of respective task in Tasks page.
11) In the Assigned column of the Tasks, the email of the assignee is listed as two users having same name could cause a confusion.
12) If a User is deleted, then the Assisned column in tasks shows(Add new Assignee) if the deleted user was assigned that task. The Manager can then assign the task to any other user.
13) If a User is deleted, then the User column for all the tasks created by that user displays "user deleted". But the tasks     remain there.
14) If the user who is assigned some task is deleted , then the Manager of the task can assignee some other user to that task .
15) If a user changes his email id, then the email id in assigned section of tasks table is automatically changed.(I have added a foreign key constraint on assigned as well
16) There is a Edit Account button in the tasks page where user can edit his account details
17) User can add new timeblock manually in the given format(in placeholder).
18) The start time should be less than the end time while making new timeblock manually. Otherwise it will flash a message saying the start time should be less.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
