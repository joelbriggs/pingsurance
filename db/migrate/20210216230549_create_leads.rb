class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.text :first_name
      t.text :last_name
      t.text :phone
      t.text :notes
      t.boolean :text_sent, null: false, default: false

      t.timestamps null: false
    end
  end
end
