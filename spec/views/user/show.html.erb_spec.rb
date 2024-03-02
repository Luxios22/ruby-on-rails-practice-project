# frozen_string_literal: true

require "rails_helper"

RSpec.describe "user/show", type: :view do
  it "renders user's profile page" do
    stub_user { User.new }
    render
    expect(rendered).to match(//)
  end
  def stub_user(&block)
    controller.singleton_class.class_exec(block) do
      helper_method :current_user
      define_method :current_user do
        block.call
      end
    end
  end
end
