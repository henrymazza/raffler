class EntrySerializer < ActiveModel::Serializer
  attributes :id, :name, :winner, :created_at, :updated_at
end
