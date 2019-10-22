class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.references :user,null:false,unique:true
      t.string :article1,null:false
      t.text :memo1
      t.text :memo2
      t.text :memo3
      t.text :memo4
      t.timestamps
    end
  end
end
