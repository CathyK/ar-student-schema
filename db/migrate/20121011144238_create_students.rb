require_relative '../config'

# this is where you should use an ActiveRecord migration to 
#ActiveRecord:Migration
class CreateStudents < ActiveRecord::Migration

  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |t|
      t.integer :id
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.date    :birthday
      t.string  :email
      t.string  :phone
   end

  end

end
