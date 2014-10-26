class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :office
      t.string :name
      t.string :nickname
      t.string :profile_image
      t.string :sex
      t.string :birthday
      t.string :bloodtype
      t.string :hometown
      t.string :height
      t.string :ability
      t.string :hobby

      t.timestamps
    end

    add_index :talents, :office
    add_index :talents, :name
    add_index :talents, :nickname
    add_index :talents, :profile_image
    add_index :talents, :sex
    add_index :talents, :birthday
    add_index :talents, :bloodtype
    add_index :talents, :hometown
    add_index :talents, :height
    add_index :talents, :ability
    add_index :talents, :hobby

  end
end
