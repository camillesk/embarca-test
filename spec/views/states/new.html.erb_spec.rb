# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'states/new', type: :view do
  before(:each) do
    assign(:state, State.new(
                     name: 'MyString',
                     population: 1
                   ))
  end

  it 'renders new state form' do
    render

    assert_select 'form[action=?][method=?]', states_path, 'post' do
      assert_select 'input[name=?]', 'state[name]'

      assert_select 'input[name=?]', 'state[population]'
    end
  end
end
