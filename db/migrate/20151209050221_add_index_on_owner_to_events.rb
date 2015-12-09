class AddIndexOnOwnerToEvents < ActiveRecord::Migration
  def change
    add_index :events, :owner_id, name: :index_events_on_owner_id
  end
end
