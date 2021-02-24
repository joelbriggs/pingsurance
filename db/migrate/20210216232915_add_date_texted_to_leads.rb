class AddDateTextedToLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :date_texted, :datetime
  end
end
