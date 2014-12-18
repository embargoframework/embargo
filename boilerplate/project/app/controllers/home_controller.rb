Cuba.define do
  on get do
    on root do
      res.write(MyModel.find.my_item)
    end
    on "home" do
      render "index", body_class: "page-index", page: "index"
    end
  end
end
