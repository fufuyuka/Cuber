class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string  :name, null: false
      t.string  :email, null: false
      t.text    :contact_detail, null: false
      t.integer :supported_status, null: false, default: "0"
      t.text    :memo
      t.timestamps
    end
  end
end
