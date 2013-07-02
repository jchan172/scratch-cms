# == Schema Information
#
# Table name: blogentries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  blog_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Blogentry do
  pending "add some examples to (or delete) #{__FILE__}"
end
