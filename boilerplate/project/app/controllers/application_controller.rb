# This is the main cntroller for your application. This file must be in your project. You can 
# include other controllers by following the example below for `/api`

class ApplicationController < Embargo
  define do
    on "api" do
      run ApiController
    end

    on root do
      res.write(MyModel.find.my_item)
    end

    on default do
      render "index", body_class: "page-index", page: "index"
    end
  end  
end