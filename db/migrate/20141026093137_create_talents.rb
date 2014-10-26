class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :office
      t.string :name
      t.string :nickname
      t.string :profile_image
      t.string :birthday
      t.string :bloodtype
      t.string :hometown
      t.string :height
      t.string :ability
      t.string :hobby

      t.timestamps
    end
  end
end
