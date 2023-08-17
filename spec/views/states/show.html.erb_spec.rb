# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'states/show', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(
                              name: 'Name',
                              population: 2
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
