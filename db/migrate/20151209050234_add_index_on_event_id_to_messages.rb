class AddIndexOnEventIdToMessages < ActiveRecord::Migration
  def change
    add_index :messages, :event_id, name: :index_messages_on_event_id
  end
end
