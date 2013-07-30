# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
