require 'test_helper'

# Docs: http://rdoc.info/github/rails/rails/master/Rails/Generators/TestCase
class AuthproGeneratorTest < Rails::Generators::TestCase
  tests AuthproGenerator
  destination File.expand_path(File.join(File.dirname(__FILE__), "rails", "dummy"))

  test "generated files" do 
    run_generator(["--force"])
    
    # models
    assert_file "app/models/user.rb"

    # migrations
    assert_migration "db/migrate/create_users.rb"

    # controllers
    assert_file "app/controllers/users_controller.rb"
    assert_file "app/controllers/sessions_controller.rb"
    assert_file "app/controllers/password_resets_controller.rb"
    assert_file "app/controllers/home_controller.rb"

    # views
    assert_file "app/views/users/new.html.erb"
    assert_file "app/views/password_resets/new.html.erb"
    assert_file "app/views/password_resets/edit.html.erb"
    assert_file "app/views/sessions/new.html.erb"
    assert_file "app/views/layouts/application.html.erb"
    assert_file "app/views/home/index.html.erb"
    assert_file "app/views/user_mailer/password_reset.text.erb"

    # mailers
    assert_file "app/mailers/user_mailer.rb"
  end
end