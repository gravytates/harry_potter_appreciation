require 'rails_helper'

describe Rating do
  it { should validate_presence_of :rating }
  it { should belong_to :character }
end
