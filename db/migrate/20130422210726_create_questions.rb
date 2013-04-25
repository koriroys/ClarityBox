class CreateQuestions < ActiveRecord::Migration
  def up
	  create_table :questions do |table|
	    table.string :week_number
	    table.string :week_start
	    table.string :week_end
	    table.string :question
    end
  end

  def down
  end

end
# end
