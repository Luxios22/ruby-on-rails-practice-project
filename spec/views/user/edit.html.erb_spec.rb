# frozen_string_literal: true

require "rails_helper"

RSpec.describe "user/edit", type: :view do
  it "renders user's edit profile page" do
    without_partial_double_verification do
      allow(view).to receive(:resource).and_return(User.new)
      allow(view).to receive(:resource_name).and_return(:user)
      allow(view).to receive(:devise_mapping).and_return(Devise.mappings[:user])
    end
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
