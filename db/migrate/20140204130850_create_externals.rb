class CreateExternals < ActiveRecord::Migration
  def change
    create_table :externals do |t|
      t.string :url
      t.belongs_to :site

      t.timestamps
    end
  end
end
