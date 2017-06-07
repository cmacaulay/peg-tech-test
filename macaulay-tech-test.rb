require 'json'
require 'pry'
# Iterate through data and:
## Return the ~ title ~ of the most likes v. dislikes
## Average % of likes vs. dislikes for 12 videos
## Total number of views
## ~ Bonus ~ the average time interval between videos

file        = File.read('zoella_videos.json')
videos_hash = JSON.parse(file)
videos      = videos_hash['videos']

def calculation_loop(videos)
  total_views = 0
  videos.each do |video|
    total_views = total_views + video['views']
  end
  p "Total Views: #{total_views}"
end

calculation_loop(videos)




# Done:
# Read the JSON file, store data
