class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.text :code
      t.belongs_to :site

      t.timestamps
    end
  end
end
