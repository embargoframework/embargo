class ApiController < Embargo

  on get do
    res.write("The API Embargo is on!")
  end

end
