# frozen_string_literal: true

class RemoveUsernameFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :username, :string
  end
end
