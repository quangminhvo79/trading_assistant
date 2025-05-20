class InitTradingAssistantTables < ActiveRecord::Migration[8.0]
  def change
    create_table :platforms do |t|
      t.string :name, null: false
      t.string :api_key
      t.string :api_secret
    end

    create_table :tokens do |t|
      t.string :symbol_name, null: false
      t.references :platform, foreign_key: true
      t.boolean :enabled, default: true

      t.integer :volume_by_percent, default: 5
      t.integer :volume_by_value, default: 100
      t.string  :volume_type, default: 'percent'
      t.decimal :initial_balances, default: 1000, precision: 15, scale: 4
      t.decimal :current_balances, default: 1000, precision: 15, scale: 4

      t.timestamps
    end

    create_table :orders do |t|
      t.references :token, foreign_key: true

      t.decimal    :usdt_amount, precision: 16, scale: 4
      t.decimal    :token_amount, precision: 16, scale: 8
      t.decimal    :entry_price, precision: 16, scale: 8
      t.decimal    :stoploss_price, precision: 16, scale: 8
      t.decimal    :takeprofit_price, precision: 16, scale: 8
      t.float      :risk_reward_ratio, default: 1.5
      t.string     :status, default: 'open'
      t.string     :side, null: false
      t.string     :order_type, default: 'market'
    end

    create_table :settings do |t|
      t.string :key, null: false
      t.string :value
      t.timestamps
    end
  end
end
