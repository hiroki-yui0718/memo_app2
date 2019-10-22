class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    add_column :memos,:article,:string
    change_column :memos,:article,:string,null:false    
    remove_column :memos,:article1,:string
  end
  def down
    add_column :memos,:article1,:string
  end
end
