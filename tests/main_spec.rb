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
    assert_equal "<!DOCTYPE html>\n<html lang='en'>\n  <head>\n    <meta charset='utf-8'>\n    <meta content='IE=edge' http-equiv='X-UA-Compatible'>\n    <title>Here is the title</title>\n  </head>\n  <body class='page-index'>\n    \n    HERE\n    \n  </body>\n</html>\n", last_response.body
  end
  test "Embargo" do
  	assert_equal Embargo.application, Cuba
  end
end