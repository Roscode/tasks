# Deprecated

This repo is decprecated in favor of [task_manager](http://github.com/Roscode/task_manager) because apparently
having the project named tasks and having a resource named tasks makes the aliasing weird in such a way that
phoenix generates the incorrect alias ordering by default, which was super annoying. So I renamed it task_manager
and started over, but I figured I'd leave it around just in case





# Tasks

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
