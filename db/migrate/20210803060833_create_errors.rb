class CreateErrors < ActiveRecord::Migration[6.1]
  def change
    create_table :errors do |t|
      t.string :path
      t.string :read_status
      t.string :priority
      t.string :hostname
      t.string :date
      t.string :title
      t.string :details
      t.string :exception_class
      t.string :exception_message
      t.string :exception_stacktrace
      t.string :request_log
      t.string :environment_variables
      t.string :request_id
      t.string :remote_ip
      t.string :site_url

      t.timestamps
    end
  end
end
