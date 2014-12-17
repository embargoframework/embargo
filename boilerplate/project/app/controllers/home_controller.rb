Cuba.define do
  on get do
    on root do
      res.write(MyModel.find.my_item)
    end
  end
end
