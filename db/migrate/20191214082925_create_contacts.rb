class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text:name
      t.text:email
      t.text:content
    end
  end
end
