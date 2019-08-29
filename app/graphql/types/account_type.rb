class Types::AccountType < Types::BaseObject
  graphql_name 'Account'

  field :id, ID, null: false
  field :name, String, null: false
end
