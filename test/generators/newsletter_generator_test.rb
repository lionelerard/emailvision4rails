require 'test_helper'
require 'generators/newsletter_generator'

class NewsletterGeneratorTest < Rails::Generators::TestCase
  tests NewsletterGenerator

  destination File.join(Rails.root, "tmp")
  setup :prepare_destination  

  test 'generation for newsletter with no parameters' do
    run_generator %w(test)
    assert_file "app/newsletters/test_newsletter.rb"
  end

  test 'generation for newsletter with parameters' do
    run_generator %w(test daily weekly)
    assert_file "app/newsletters/test_newsletter.rb"
    assert_file "app/views/test_newsletter/daily.html.emv"
    assert_file "app/views/test_newsletter/daily.text.emv"
    assert_file "app/views/test_newsletter/weekly.html.emv"
    assert_file "app/views/test_newsletter/weekly.text.emv"
  end  

  test 'generation for namespaced newsletter with parameters' do
    run_generator %w(admin/test daily weekly)
    assert_file "app/newsletters/admin/test_newsletter.rb"
    assert_file "app/views/admin/test_newsletter/daily.html.emv"
    assert_file "app/views/admin/test_newsletter/daily.text.emv"
    assert_file "app/views/admin/test_newsletter/weekly.html.emv"
    assert_file "app/views/admin/test_newsletter/weekly.text.emv"
  end    

end
