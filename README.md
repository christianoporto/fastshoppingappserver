# fast shopping api

[![Build Status](https://dev.azure.com/wahio/wahio/_apis/build/status/christianoporto.fastshoppingappserver?branchName=master)](https://dev.azure.com/wahio/wahio/_build/latest?definitionId=46&branchName=master)


## Database config

add the following parameters in the environment variable group, To use it locally please create the .env file and assign the values

| PARAM      | EXAMPLE     | DESCRIPTION       |
| ---------- | ----------- | ----------------- |
| DB_HOST    | host        | Host name         |
| DB_NAME    | storeapp_db | Dababase name     |
| DB_PASS    | 1234        | Database password |
| DB_USER    | root        | Database user     |
| DB_DIALECT | mysql       | Database          |

## Available Scripts

In the project directory, you can run:

### `npm run dev`

Runs the app in the development mode.<br>
Open [http://localhost:5000](http://localhost:5000) to view it in the browser.

### `npm test`

Launches the test runner in the interactive watch mode.<br>

### `npm run build`

Builds the app for production to the `build` folder.<br>