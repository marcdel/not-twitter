require 'spec_helper'

describe 'AuthenticationPages' do
  subject { page }

  describe 'Sign In page' do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign In') }
    it { should have_selector('title', text: 'Sign In') }
  end

  describe 'Sign In' do
    before { visit signin_path }

    describe 'with invalid information' do
      before { click_button 'Sign In' }

      it { should have_selector('title', text: 'Sign In') }
      it { should have_error_message 'Invalid' }

      describe 'after visiting another page' do
        before { click_link 'Home' }
        it { should_not have_error_message 'Invalid' }
      end
    end

    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile',  href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }

      describe 'after visiting the Home page' do
        before { click_link 'Home' }
        it { should_not have_link('DEHUMANIZE YOURSELF AND FACE TO BLOODSHED',
                                  href: signup_path) }
      end

      describe 'followed by Sign Out' do
        before { click_link 'Sign Out' }
        it { should have_link('Sign In') }
      end
    end
  end
end
