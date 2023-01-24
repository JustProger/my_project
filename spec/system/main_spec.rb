# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  scenario 'creating a User, checking his data, creating post with comment and destroying them all' do
    visit root_path # переходим на страницы ввода

    click_on 'Signup'

    fill_in 'user[name]', with: 'test'
    fill_in 'user[email]', with: 'test@mail.ru'
    fill_in 'user[password]', with: '1'
    fill_in 'user[password_confirmation]', with: '1'

    find('input[name=commit]').click

    # ожидаем найти в контенере вывода правильное содержимое
    expect(find('body')).to have_text('User: @test')

    click_on 'User: @test'

    expect(find('h1')).to have_text('Profile')

    click_on 'Create post'

    fill_in 'post[title]', with: 'Test\'s new post'
    fill_in 'post[content]', with: 'blablabla'

    click_on 'Create'

    expect(find('body')).to have_text('Test\'s new post')
    expect(find('body')).to have_text('test')
    expect(find('body')).to have_text('blablabla')

    click_on 'Test\'s new post'

    fill_in 'comment[content]', with: 'Test\'s comment on his post'

    click_on 'Create'

    expect(find('body')).to have_text('Test\'s comment on his post')

    message = accept_alert do
      find('#delete_comment_btn').click
    end

    expect(message).to have_text('Delete comment. Are you sure?')

    expect(find('body')).to have_text('Comment was successfully removed!')

    message = accept_alert do
      find('#delete_post_btn').click
    end

    expect(message).to have_text('Delete post. Are you sure?')

    expect(find('body')).to have_text('Post was successfully removed!')

    find('#users_list_btn').click

    message = accept_alert do
      find('#users_list_delete_user_btn').click
    end

    expect(message).to have_text('Delete user. Are you sure?')

    expect(find('body')).to have_text('User was successfully deleted!')
  end

  scenario 'checking user\s data' do

  end
end
