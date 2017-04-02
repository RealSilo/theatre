class AddReferenceToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :reference, :string
  end

  def down
    remove_column :tickets, :reference, :string
  end
end
