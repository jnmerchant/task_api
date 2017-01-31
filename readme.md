#task api
Using Sinatra, build an API that has at least one resource and supports CRUD behavior.

For example, if your resource was a Task you would first implement the following endpoints:

GET /api/tasks - return all tasks as JSON
GET /api/tasks/:id - return an individual by id task as JSON
POST /api/tasks - create a new task, read request body as JSON for input task data
PUT /api/tasks/:id - update a task by id, read request body as JSON for input task data
DELETE /api/tasks/:id - delete a task by id
Ensure that you return proper success/failure HTTP status codes based on the user input and results, for example return 200 if it was successful, 201 if it created a new resource, or return 404 if it cannot find a resource with a given id.

API implements get/post/put/delete endpoints.

The API points to the tasks_api database and uses the tasks table.

GEM (sample)
  remote: https://rubygems.org/
  specs:
    daemons (1.2.4)
    eventmachine (1.2.2)
    pg (0.19.0)
    rack (1.6.5)
    rack-protection (1.5.3)
    sinatra (1.4.8)
    tilt (2.0.6)

PLATFORMS
  ruby

DEPENDENCIES
  pg
  sinatra
  thin

  Joe Merchant
