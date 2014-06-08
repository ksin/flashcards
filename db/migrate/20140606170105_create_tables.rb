class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.timestamp
    end

    create_table :rounds do |t|
      t.integer :user_id
      t.integer :deck_id
      t.integer :correct, :default => 0
      t.integer :incorrect, :default => 0

      t.timestamps
    end

    create_table :decks do |t|
      t.string :name

      t.timestamps
    end

    create_table :assemblies do |t|
      t.integer :deck_id
      t.integer :card_id

      t.timestamps
    end

    create_table :cards do |t|
      t.string :word
      t.text :definition

      t.timestamps
    end
  end

end
