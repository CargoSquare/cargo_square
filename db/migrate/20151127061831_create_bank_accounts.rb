class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :bank_code
      t.string :account_number
      t.text   :etc

      t.timestamps null: false
    end
  end
end
