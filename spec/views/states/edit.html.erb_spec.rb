# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'states/edit', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(
                              name: 'MyString',
                              population: 1
                            ))
  end

  it 'renders the edit state form' do
    render

    assert_select 'form[action=?][method=?]', state_path(@state), 'post' do
      assert_select 'input[name=?]', 'state[name]'

      assert_select 'input[name=?]', 'state[population]'
    end
  end
end
