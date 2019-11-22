class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :solved, default: false
      t.integer :replies_count, default: 0

      t.timestamps
    end

    add_index :questions, :slug
  end
end
