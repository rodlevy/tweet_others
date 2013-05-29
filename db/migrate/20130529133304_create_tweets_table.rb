class CreateTweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references    :user
      t.string        :status
      t.timestamps

    end
  end
end
