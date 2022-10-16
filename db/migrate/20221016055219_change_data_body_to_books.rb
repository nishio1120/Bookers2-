class ChangeDataBodyToBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :body, :text
  end
end
