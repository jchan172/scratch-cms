# == Schema Information
#
# Table name: custompages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Custompage do
  pending "add some examples to (or delete) #{__FILE__}"
end
