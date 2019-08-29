class Types::QueryType < Types::BaseObject
  field :accounts, Connections::AccountsConnection, null: false do
    # authorize [:index, Account]
  end

  def accounts(**_args)
    # Loaders::RecordLoader.for(Account).load_many(_args[:ids])
    Account.order(name: :asc)
  end

  field :account, Types::AccountType, null: true do
    description 'Account details'
    argument :id, ID, required: true
  end

  def account(id)
    Account.find_by(id)
  end
end
