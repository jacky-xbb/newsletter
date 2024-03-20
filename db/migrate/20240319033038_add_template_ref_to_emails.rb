class AddTemplateRefToEmails < ActiveRecord::Migration[7.1]
  def change
    add_reference :emails, :template, foreign_key: true
  end
end
