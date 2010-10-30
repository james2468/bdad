class CreateSketches < ActiveRecord::Migration
  def self.up
    create_table :sketches do |t|
      t.string        :title
      t.string        :byline
      t.integer       :district_id
      t.string        :token,       :limit => 16
      t.text          :paths
      t.multi_polygon :geometry
      t.timestamps
    end
    add_index :sketches, :district_id
    add_index :sketches, :token
    add_index :sketches, :updated_at
  end

  def self.down
    begin
      drop_table :sketches
    rescue ActiveRecord::StatementInvalid => e
      puts "   -> sketches does not exist"
    end
  end
end