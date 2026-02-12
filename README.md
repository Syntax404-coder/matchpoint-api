# MatchPoint API

A Ruby on Rails GraphQL API for a dating/matching application.

## Prerequisites

Before you start, make sure you have the following installed on your machine:

- **Ruby 3.4.1**: Download "Ruby+Devkit 3.4.1-1 (x64)" from [rubyinstaller.org](https://rubyinstaller.org/downloads/)
- **Rails**: `gem install rails`
- **Bundler**: `gem install bundler`
- **PostgreSQL**: Make sure the PostgreSQL service is running and you have a user with permission to create databases.

Verify your installation:

```sh
ruby -v
rails -v
psql --version
```

## detailed setup

1.  **Open your terminal** and navigate to the project directories:
    ```sh
    cd matchpoint-api-1
    ```

2.  **Install dependencies**:
    ```sh
    bundle install
    ```

3.  **Setup the database**:
    Create the database, run migrations, and seed it with initial data.
    ```sh
    rails db:create db:migrate db:seed
    ```

4.  **Start the server**:
    ```sh
    rails server
    ```
    You should see output indicating the server has started, usually on port 3000.

## Accessing the API

Once the server is running, the GraphQL API is available at:
`http://localhost:3000/graphql`

You can use a tool like **Postman** or **Insomnia** to interact with the API.

### Postman Collection
A Postman collection is included in this repository to help you test the API endpoints.
1.  Locate the file `matchpoint_postman_collection.json` in the root directory.
2.  Import this file into Postman.
3.  The collection is pre-configured to work with `http://localhost:3000`.


