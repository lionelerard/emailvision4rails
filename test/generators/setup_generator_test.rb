require 'test_helper'
require 'generators/emailvision4rails/setup_generator'

class SetupGeneratorTest < Rails::Generators::TestCase
  tests Emailvision4rails::SetupGenerator

  destination File.join(Rails.root, "tmp")
  setup :prepare_destination

  def test_setup_generator
    run_generator
    assert_file "config/emailvision.yml"
  end
end
