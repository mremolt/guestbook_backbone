class Entry < ActiveRecord::Base
end
# == Schema Information
#
# Table name: entries
#
#  id         :integer         not null, primary key
#  user       :string(255)     not null
#  email      :string(255)     not null
#  homepage   :string(255)
#  body       :text            not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

