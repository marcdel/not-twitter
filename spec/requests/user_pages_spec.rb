require 'spec_helper'

describe 'User pages' do
  subject { page }

  describe 'Sign Up page' do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign Up') }
    it { should have_selector('title', text: 'Sign Up') }
  end

  describe 'Profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe 'Sign Up' do

    before { visit signup_path }

    let(:submit) { 'Create Account' }

    describe 'with invalid information' do
      it 'should not create a user' do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe 'after submission' do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign Up') }
        it { should have_content('error') }
      end
    end

    describe 'with valid information' do
      # WHY DOESN'T THIS WORRRRRKKKKKK
      #let(:user) { FactoryGirl.create(:user) }

      #before do
      #  user = FactoryGirl.create(:user)
      #  fill_in 'Name',         with: user.name
      #  fill_in 'Email',        with: user.email
      #  fill_in 'Password',     with: user.password
      #  fill_in 'Confirmation', with: user.password_confirmation
      #end

      before do
        fill_in 'Name',         with: 'Example User'
        fill_in 'Email',        with: 'user@example.com'
        fill_in 'Password',     with: 'foobar'
        fill_in 'Confirmation', with: 'foobar'
      end

      it 'should create a user' do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end