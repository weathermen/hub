class CreateInstances < ActiveRecord::Migration[5.2]
  def change
    enable_extension :citext
    create_table :instances do |t|
      t.citext :host, null: false, unique: true
      t.string :version, null: false

      t.timestamps
    end
  end
end
