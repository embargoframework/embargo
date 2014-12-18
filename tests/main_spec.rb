require "cuba/test"
Dir.chdir "boilerplate/project"
require_relative "../lib/embargo"

scope do
  test "Root" do
    get "/"
    assert_equal "Hello world!", last_response.body
  end
  test "Homepage" do
    get "/home"
    page_html = "<!DOCTYPE html>\n<html lang='en'>\n  <head>\n    <meta charset='utf-8'>\n    <meta content='IE=edge' http-equiv='X-UA-Compatible'>\n    <title>\"The Title\"</title>\n  </head>\n  <body class='page-index'>\n    \n    \n    \n  </body>\n</html>\n"
    assert_equal page_html, last_response.body
  end
  test "Embargo" do
  	assert_equal Embargo.application, Cuba
  end
  test "Object Blank?" do
    o = Object.new
    assert_equal o.blank?, false
  end
  test "Humanize String" do
    string = "Here_Is".humanize
    assert_equal string, "Here Is"
  end
  test "Humanize Symbol" do
    string = :Here_Is.humanize
    assert_equal string, "Here Is"
  end
  test "Embargo Directory" do
    directory = Embargo.app_directory
    assert_equal directory, Dir.pwd
  end
  test "Embargo Directory" do
    directory = Embargo.directory
    assert_equal directory.match("embargo.rb").to_s, "embargo.rb"
  end
end