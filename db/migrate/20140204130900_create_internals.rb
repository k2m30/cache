class CreateInternals < ActiveRecord::Migration
  def change
    create_table :internals do |t|
      t.string :url
      t.belongs_to :external
      t.timestamps
    end
  end
end
