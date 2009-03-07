class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.string :name
      t.string :url_id, :null => false
    end
    add_index :contributors, :url_id, :unique => true

    create_table :commits do |t|
      t.string    :object_id, :null => false
      t.string    :author
      t.timestamp :author_timestamp
      t.string    :committer
      t.timestamp :committer_timestamp
      t.text      :subject
      t.text      :description
      t.boolean   :imported_from_svn
      t.text      :changelog
    end
    add_index :commits, :object_id, :unique => true

    create_table :contributions do |t|
      t.references :contributor
      t.references :commit
    end
    add_index :contributions, :contributor_id
    add_index :contributions, :commit_id
  end

  def self.down
    drop_table :contributors
    drop_table :commits
    drop_table :contributions
  end
end
