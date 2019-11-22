class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :question, null: false, foreign_key: true
      t.references :reply, null: true, foreign_key: true, class_name: 'Reply'
      t.text :body

      t.timestamps
    end
  end
end
