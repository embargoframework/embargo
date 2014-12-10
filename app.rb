require 'cuba'
require 'tilt/haml'
require 'haml'
require 'traitify'

require_relative 'config/init'
require_relative 'lib/content_for'

traitify = Traitify.new

Cuba.define do
  on post do
    on "assessments" do
      assessment = traitify.create_assessment(deck_id: "career-deck")
      res["Content-Type"] = "application/json"
      res.write({id: assessment.id}.to_json)
    end
  end

  on get do
    on "results/:assessment_id" do |assessment_id|
      results = traitify.find_results(assessment_id)
      blends_host = "https://s3.amazonaws.com/traitify-cdn/assets/images/blends/"
      name_1 = results.personality_blend.personality_type_1.name.downcase.gsub(/-/, "")
      name_2 = results.personality_blend.personality_type_2.name.downcase.gsub(/-/, "")

      blend_name = "#{name_1}_#{name_2}"
      blend_url = "#{blends_host}#{blend_name}.jpg"
      if results
        render "results", assessment_id: assessment_id, blend_url: blend_url, results: results, body_class: "page-results", page: "/results/#{assessment_id}"
      else
        res.redirect "/"
      end
    end

    on ":page" do |page|
      if %w(press privacy science team terms).include?(page)
        render page, body_class: "page-#{page}", page: page
      else
        res.redirect "/"
      end
    end

    on root do
      res.write(partial("index"))
    end
  end
end