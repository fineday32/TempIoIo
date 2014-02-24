class CreateAlertRules < ActiveRecord::Migration
  def change
    create_table :alert_rules do |t|

      t.timestamps
    end
  end
end
