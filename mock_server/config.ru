require "roda"

class App < Roda
  route do |r|
    r.root do
      r.redirect "/outlier/1"
    end

    r.get "slow_service" do
      sleep(r.params.fetch("sleep_time", 1).to_i)
      "This is a cool pet you might like!"
    end

    r.on "outlier" do
      r.get Integer do |id|
        if slow_down?(id)
          sleep(2)
          "This is a REALLY cool pet you might like!"
        else
          "This is a cool pet you might like!"
        end
      end
    end

    r.get "fast_service" do
      "This is a cool pet you might like!"
    end
  end

  def slow_down?(id)
    id.to_i % 100 == 0
  end
end

run App.freeze.app
