require 'rails_helper'

describe Character do
  it { should validate_presence_of :name }
  it { should validate_presence_of :location }
  it { should validate_presence_of :rating }
  it { should have_many :reviews }
end
