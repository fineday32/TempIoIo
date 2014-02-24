class RuleFormation < ActiveRecord::Migration
  def change
  	add_column :alert_rules , :content, :string
  	add_column :alert_rules , :rule_type, :string
  	add_column :comments, :rule_id, :integer
  end
end
