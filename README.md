# README
This is a demo / test of the Zeitwerk error with the graphql-ruby gem

## Setup

This is as close to exact (barring a lot less data) to what I am using with an application @ IBM. I did not create any views or even controllers as this is reproducible through any post request or graphiql which is also installed.

```ruby
rails db:migrate db:seed
```

This creates and adds 50 Accounts to an accounts table. _I use Postgres internally but this results the same with sqlite._ 

I use a connection for pagination so I made sure I reproduced that exact for consistency's sake as well

## Reproduce the error
1. Boot application in development
2. verify you can return a list of accounts:
```json
{
  accounts {
    edges {
      cursor
      node {
        id
        name
      }
    }
  }
}
```
2. Pull a single account
```json
{
  account(id: 1) {
    name
  }
}
```
3. Comment out the account method or change anything within the query_type.rb file with the application running

4. Attempt query again (don't use the one you just commented out)

5. Congrats you have reproduced the error
6. restart the application to get the changes reflected

### Alternate method

1. do the prior until #3
2. Adjust anything in the account_type.rb files
3. Attempt query
5. Error occurs in exact 
