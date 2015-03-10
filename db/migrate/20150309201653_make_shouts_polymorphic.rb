class MakeShoutsPolymorphic < ActiveRecord::Migration
  class Shout < ActiveRecord::Base
    belongs_to :content, polymorphic: true
  end

  class TextShout < ActiveRecord::Base; end

  def change
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer

    convert_shouts_to_text_shouts

    remove_column :shouts, :body, :string
    add_index :shouts, [:content_type, :content_id]
  end

  private

  def convert_shouts_to_text_shouts
    Shout.find_each do |shout|
      reversible do |dir|
        dir.up do
          text_shout = TextShout.create(body: shout.body)
          shout.update(content_id: text_shout.id, content_type: "TextShout")
        end

        dir.down do
          shout.reload
          shout.update(body: shout.content.body)
        end
      end
    end
  end
end
