class AccountsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type(Types::AccountType)
end

class Connections::AccountsConnection < GraphQL::Types::Relay::BaseConnection
  field :total_count, Integer, null: false
  def total_count
    object.nodes.size
  end
  edge_type(AccountsEdgeType)
end
