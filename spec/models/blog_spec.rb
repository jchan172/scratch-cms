# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Blog do
  pending "add some examples to (or delete) #{__FILE__}"
end
