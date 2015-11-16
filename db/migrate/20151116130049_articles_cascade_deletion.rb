class ArticlesCascadeDeletion < ActiveRecord::Migration
  def change
    remove_foreign_key :articles, :users
    add_foreign_key :articles, :users, on_delete: :cascade
  end
end
