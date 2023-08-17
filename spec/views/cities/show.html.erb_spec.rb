# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/show', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
                            name: 'Name',
                            population: 2,
                            state: nil
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
